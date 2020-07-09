//
//  ServerManager.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Alamofire
import Foundation
import Network

class ServerManager {
    // MARK: - Instance

    static let Instance = ServerManager()
    private(set) static var hasInternet = true
    private(set) static var forceNoInternet = false
    private(set) static var logServerRequest = true

    let monitor = NWPathMonitor()

    private init() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    if !ServerManager.forceNoInternet {
                        ServerManager.hasInternet = true
                    }
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    ServerManager.hasInternet = false
                }
            }
        }
        monitor.start(queue: DispatchQueue(label: "Monitor"))
    }

    // MARK: - Stations

    private let staticStationsURL = "https://transport.data.gouv.fr/gbfs/nantes/station_information.json"
    private let staticStationsStatusURL = "https://transport.data.gouv.fr/gbfs/nantes/station_status.json"

    func FetchStations(onDone: @escaping ([StationInformation]) -> Void, onError: @escaping (Error?) -> Void) {
        GET(staticStationsURL).response { response in
            self.GlobalHandler(response: response, onError: onError, onNoInternet: {
                onDone([])
            }) { response in
                // Init stations
                let decoder = JSONDecoder()
                do {
                    var stationsInformations = try decoder.decode(StationsInformations.self, from: response.data ?? Data()).data.stationsInformations

                    self.FetchStationsStatus(onDone: { (stationsStatus) in
                        stationsInformations = stationsInformations.map({ (station: StationInformation) in
                            let stat = station
                            stat.status = stationsStatus.first(where: { (status: StationStatus) in
                                status.id == station.id
                            })
                            stat.save()
                            return stat
                        })

                        onDone(stationsInformations)
                    }, onError: onError)
                } catch {
                    logger.error("Error while create StationsInformations \(error)")
                    logger.warn(String(data: response.data ?? Data(), encoding: String.Encoding.utf8))
                    onError(error)
                }
            }
        }
    }

    func FetchStationsStatus(onDone: @escaping ([StationStatus]) -> Void, onError: @escaping (Error?) -> Void) {
        GET(staticStationsStatusURL).response { response in
            self.GlobalHandler(response: response, onError: onError, onNoInternet: {
                onDone([])
            }) { response in
                // Init stations
                let decoder = JSONDecoder()
                do {
                    let stationsStatus = try decoder.decode(StationsStatus.self, from: response.data ?? Data())
                    onDone(stationsStatus.data.stationsStatus)
                } catch {
                    logger.error("Error while create StationsStatus \(error)")
                    logger.warn(String(data: response.data ?? Data(), encoding: String.Encoding.utf8))
                    onError(error)
                }
            }
        }
    }

    // MARK: - Global Methods

    func GlobalHandler(response: AFDataResponse<Data?>, autoLogged: Bool = false, onError: @escaping (Error?) -> Void, onNoInternet: @escaping () -> Void, onSuccess: @escaping (AFDataResponse<Data?>) -> Void) {
        if response.response == nil || response.error != nil || ServerManager.forceNoInternet {
            logger.error("Request error \(response.error?.errorDescription ?? "nil")")
            // No internet access ??
            ServerManager.hasInternet = false
            logger.info("No Internet")
            onNoInternet()
            return
        }
        ServerManager.hasInternet = true

        switch response.response!.statusCode {
        case 200 ... 299:
            onSuccess(response)
            break
        case 400 ... 499:
            logger.error(response.debugDescription)
            onError(response.error)
            break
        default:
            logger.error(response.debugDescription)
            onError(response.error)
            break
        }
    }

    func GET(_ route: String, single: Bool = false) -> DataRequest {
        if ServerManager.logServerRequest {
            logger.info("GET on \(route)")
        }
        var headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token") ?? "")]
        if single {
            headers.add(name: "Accept", value: "application/json")
        }
        return AF.request(route.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!, method: .get, headers: headers)
    }

    func POST(withoutApiURL: Bool = false, _ route: String, _ parameters: Parameters) -> DataRequest {
        if ServerManager.logServerRequest {
            logger.info("POST on \(route) with parameters \(String(describing: parameters))")
        }
        return AF.request(route, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: route == "/rpc/login" ? [] : [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token") ?? "")])
    }

    func PATCH(withoutApiURL: Bool = false, _ route: String, _ parameters: Parameters) -> DataRequest {
        if ServerManager.logServerRequest {
            logger.info("PUT on \(route) with parameters \(String(describing: parameters))")
        }
        return AF.request(route, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token") ?? "")])
    }

    func DELETE(withoutApiURL: Bool = false, _ route: String) -> DataRequest {
        if ServerManager.logServerRequest {
            logger.info("DELETE on \(route)")
        }
        return AF.request(route, method: .delete, headers: .init(["Authorization": UserDefaults.standard.string(forKey: "token") ?? ""]))
    }

    func DOWNLOAD(withoutApiURL: Bool = false, _ route: String, destination: @escaping DownloadRequest.Destination) -> DownloadRequest {
        if ServerManager.logServerRequest {
            logger.info("DOWNLOAD on \(route)")
        }
        return AF.download(route, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: .init(["Authorization": UserDefaults.standard.string(forKey: "token") ?? ""]), to: destination)
    }

    func UPLOAD(withoutApiURL: Bool = false, _ route: String, datas: Data, filename: String, extensionName: String) -> UploadRequest {
        if ServerManager.logServerRequest {
            logger.info("UPLOAD on \(route)")
        }

        var mimeType = ""
        switch extensionName {
        case "jpg", "jpeg", "JPG", "JPEG":
            mimeType = "image/jpg"
        case "png", "PNG":
            mimeType = "image/png"
        default:
            logger.warn("Extension not handled: \(extensionName)")
            mimeType = "image/jpg"
        }

        return AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(datas, withName: "document", fileName: "\(filename).\(extensionName)", mimeType: mimeType)
        }, to: route, headers: .init(["Authorization": UserDefaults.standard.string(forKey: "token") ?? ""]))
    }
}
