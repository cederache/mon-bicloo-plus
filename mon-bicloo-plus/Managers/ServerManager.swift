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
import WidgetKit

class ServerManager {
    // MARK: - Instance

    static let Instance = ServerManager()
    private(set) static var hasInternet = true
    private(set) static var forceNoInternet = false
    private(set) static var logServerRequest = false

    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "com.cederache.mon-bicloo-plus.api", qos: .background, attributes: .concurrent)

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

    func FetchStationsStatus(onDone: @escaping ([Station]) -> Void, onError: @escaping (Error?) -> Void) {
        GET(Constants.stationDataSetURL).response(queue: queue) { response in
            self.GlobalHandler(response: response, onError: onError, onNoInternet: {
                onDone([])
            }) { response in
                // Init stations
                let decoder = JSONDecoder()
                do {
                    let stationsRecords = try decoder.decode(StationsRecords.self, from: response.data ?? Data())
                    
                    // Save stations in the same transactions
                    Station.modifyIfNeeded {
                        for station in stationsRecords.records.map({$0.fields}) {
                            station.saveInWrite()
                        }
                    }
                    
                    WidgetCenter.shared.reloadAllTimelines()
                    onDone(stationsRecords.records.map({$0.fields}))
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
        DispatchQueue.main.async {
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
    }

    func GET(_ route: String) -> DataRequest {
        if ServerManager.logServerRequest {
            logger.info("GET on \(route)")
        }
        return AF.request(route, method: .get)
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
