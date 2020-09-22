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

    private var _stations: [Station] = []

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
    
    var stationsIds: [Int] {
        let jsonDecoder = JSONDecoder()
        return (try? jsonDecoder.decode([Int].self, from: _stationsIds.data(using: String.Encoding.utf8) ?? Data())) ?? []
    }

    func addStation(_ station: Station) {
        self.modify {
            var tmpStationsIds = stationsIds
            tmpStationsIds.append(station.id)
            let jsonEncoder = JSONEncoder()
            _stationsIds = String(data: (try? jsonEncoder.encode(tmpStationsIds)) ?? Data(), encoding: String.Encoding.utf8) ?? "[]"
        }
        self.save()
    }

    func removeStation(_ station: Station) {
        self.modify {
            var tmpStationsIds = stationsIds
            tmpStationsIds.removeAll(where: { $0 == station.id })
            let jsonEncoder = JSONEncoder()
            _stationsIds = String(data: (try? jsonEncoder.encode(tmpStationsIds)) ?? Data(), encoding: String.Encoding.utf8) ?? "[]"
        }
        self.save()
    }

    var stations: [Station] {
        if isInvalidated {
            return []
        }
        if _stations == [] {
            _stations = Station.getAll(filterIn: "_id", values: stationsIds) as? [Station] ?? []
        }
        return _stations
    }
}

extension StationsGroup {
    func nextIndex() -> Int {
        (StationsGroup.getFirst(sortedBy: "_index") as? StationsGroup)?.index ?? 0 + 1
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
