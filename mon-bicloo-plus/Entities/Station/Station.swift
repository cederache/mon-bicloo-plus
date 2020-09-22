//
//  StationStatus_v2.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 22/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import MapKit
import RealmSwift
import SwiftUI

struct StationsRecords: Codable {
    var records: [StaticStation]

    enum CodingKeys: String, CodingKey {
        case records
    }
}

struct StaticStation: Codable {
    var fields: Station

    enum CodingKeys: String, CodingKey {
        case fields
    }
}

class StationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let station: Station

    init(title: String?, latitude: Double, longitude: Double, station: Station) {
        self.title = title
        coordinate = CLLocation(latitude: latitude, longitude: longitude).coordinate
        self.station = station
    }
}

class Station: Object, Codable, Identifiable {
    @objc internal dynamic var _id: Int = 0
    @objc internal dynamic var _name: String = ""
    @objc internal dynamic var _capacity: Int = 0
    @objc internal dynamic var _nbDocksAvailable: Int = 0
    @objc internal dynamic var _nbBikesAvailable: Int = 0
    @objc internal dynamic var _lastReported: String = ""
    @objc internal dynamic var _address: String = ""
    let _position = RealmSwift.List<Double>()

    private var __position: [Double] = [0.0, 0.0]

    override static func primaryKey() -> String? {
        return "_id"
    }

    enum CodingKeys: String, CodingKey {
        case _id = "number"
        case _name = "name"
        case _capacity = "bike_stands"
        case _nbDocksAvailable = "available_bike_stands"
        case _nbBikesAvailable = "available_bikes"
        case _lastReported = "last_update"
        case _address = "address"
        case __position = "position"
    }

    var id: Int {
        isInvalidated ? 0 : _id
    }

    var name: String {
        isInvalidated ? "" : _name
    }

    var capacity: Int {
        isInvalidated ? 0 : _capacity
    }

    var nbDocksAvailable: Int {
        isInvalidated ? 0 : _nbDocksAvailable
    }

    var nbBikesAvailable: Int {
        isInvalidated ? 0 : _nbBikesAvailable
    }

    var lastReported: String {
        isInvalidated ? "" : _lastReported
    }

    var address: String {
        isInvalidated ? "" : _address
    }

    var latitude: Double {
        isInvalidated ? 0.0 : _position.first ?? 0.0
    }

    var longitude: Double {
        isInvalidated ? 0.0 : _position.last ?? 0.0
    }

    var displayName: String {
        return displayNameCapitalized
            .split(separator: " ")
            .map({ word in
                word.lowercased().capitalizingFirstLetter()
            })
            .joined(separator: " ")
    }

    var displayNameCapitalized: String {
        let regex = try! NSRegularExpression(pattern: "#?[0-9]*\\s?-\\s?")
        let range = NSMakeRange(0, name.count)
        return regex
            .stringByReplacingMatches(in: name, options: [], range: range, withTemplate: "")
    }

    var nbDocksOoo: Int {
        return capacity - nbDocksAvailable - nbBikesAvailable
    }

    var nbDocksAvailableColor: Color {
        if nbDocksAvailable == 0 {
            return Color.red
        } else if nbDocksAvailable <= 3 {
            return Color.orange
        }
        return Color.green
    }

    var nbDocksAvailableUIColor: UIColor {
        if nbDocksAvailable == 0 {
            return UIColor.red
        } else if nbDocksAvailable <= 3 {
            return UIColor.orange
        }
        return UIColor.green
    }

    var nbBikesAvailableColor: Color {
        if nbBikesAvailable == 0 {
            return Color.red
        } else if nbBikesAvailable <= 3 {
            return Color.orange
        }
        return Color.green
    }

    var nbBikesAvailableUIColor: UIColor {
        if nbBikesAvailable == 0 {
            return UIColor.red
        } else if nbBikesAvailable <= 3 {
            return UIColor.orange
        }
        return UIColor.green
    }

    var annotation: StationAnnotation {
        return StationAnnotation(title: name, latitude: latitude, longitude: longitude, station: self)
    }

    override func save() {
        _position.removeAll()
        _position.append(objectsIn: __position)
        super.save()
    }

    override func saveInWrite() {
        _position.removeAll()
        _position.append(objectsIn: __position)
        super.saveInWrite()
    }
}
