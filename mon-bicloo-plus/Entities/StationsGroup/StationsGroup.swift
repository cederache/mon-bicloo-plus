//
//  StationsGroup.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 08/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import RealmSwift

class StationsGroup: Object, EntitySafe, Codable, Identifiable {
    @objc internal dynamic var _id: String = ""
    @objc internal dynamic var _name: String = ""
    @objc internal dynamic var _index: Int = 0
    @objc internal dynamic var _sortMode: Int = 0
    @objc internal dynamic var _stationsIds: String = ""

    private var _stations: [StationInformation] = []

    override static func primaryKey() -> String? {
        return "_id"
    }

    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _name = "name"
        case _index = "index"
        case _sortMode = "sortMode"
        case _stationsIds = "stationsIds"
    }

    var id: String {
        isInvalidated ? "" : _id
    }

    var name: String {
        get {
            isInvalidated ? "" : _name
        }
        set {
            if !isInvalidated {
                self.modify {
                    _name = newValue
                }
            }
        }
    }

    var index: Int {
        get {
            isInvalidated ? 0 : _index
        }
        set {
            if !isInvalidated {
                self.modify {
                    _index = newValue
                }
            }
        }
    }

    var sortMode: Int {
        get {
            isInvalidated ? 0 : _sortMode
        }
        set {
            if !isInvalidated {
                self.modify {
                    _sortMode = newValue
                }
            }
        }
    }
    
    var stationsIds: [String] {
        let jsonDecoder = JSONDecoder()
        return (try? jsonDecoder.decode([String].self, from: _stationsIds.data(using: String.Encoding.utf8) ?? Data())) ?? []
    }

    func addStation(_ station: StationInformation) {
        self.modify {
            var tmpStationsIds = stationsIds
            tmpStationsIds.append(station.id)
            let jsonEncoder = JSONEncoder()
            _stationsIds = String(data: (try? jsonEncoder.encode(tmpStationsIds)) ?? Data(), encoding: String.Encoding.utf8) ?? "[]"
        }
        self.save()
    }

    func removeStation(_ station: StationInformation) {
        self.modify {
            var tmpStationsIds = stationsIds
            tmpStationsIds.removeAll(where: { $0 == station.id })
            let jsonEncoder = JSONEncoder()
            _stationsIds = String(data: (try? jsonEncoder.encode(tmpStationsIds)) ?? Data(), encoding: String.Encoding.utf8) ?? "[]"
        }
        self.save()
    }

    var stations: [StationInformation] {
        if isInvalidated {
            return []
        }
        if _stations == [] {
            _stations = DatabaseManager.Instance.realm.objects(StationInformation.self).filterIn(fieldName: "_id", values: stationsIds).toArray(ofType: StationInformation.self)
        }
        return _stations
    }
}

extension StationsGroup {
    func nextIndex() -> Int {
        DatabaseManager.Instance.realm.objects(StationsGroup.self).sorted(byKeyPath: "_index").toArray(ofType: StationsGroup.self).first?.index ?? 0 + 1
    }
    
    convenience init(name: String) {
        self.init()
        _id = Self.newId()
        _name = name
        _index = nextIndex()
        _sortMode = 0
        _stations = []
    }
}
