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
    internal var _stationsIds = List<String>()

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
        isInvalidated ? [] : _stationsIds.toArray(ofType: String.self)
    }

    var stations: [StationInformation] {
        get {
            if isInvalidated {
                return []
            }
            if _stations == [] {
                _stations = DatabaseManager.Instance.realm.objects(StationInformation.self).filterIn(fieldName: "_id", values: _stationsIds.toArray(ofType: String.self)).toArray(ofType: StationInformation.self)
            }
            return _stations
        }
        set {
            if !isInvalidated {
                self.modify {
                    _stations = newValue
                    _stationsIds = List<String>()
                    _stationsIds.append(objectsIn: _stations.map({ $0.id }))
                }
            }
        }
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
