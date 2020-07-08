//
//  Station.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import MapKit
import RealmSwift

struct StationsInformations: Codable {
    var ttl: Double
    var lastUpdate: Double
    var data: StaticStationsInformations

    enum CodingKeys: String, CodingKey {
        case ttl
        case lastUpdate = "last_updated"
        case data
    }
}

struct StaticStationsInformations: Codable {
    var stationsInformations: [StationInformation]

    enum CodingKeys: String, CodingKey {
        case stationsInformations = "stations"
    }
}

class StationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?, latitude: Double, longitude: Double) {
        self.title = title
        self.coordinate = CLLocation(latitude: latitude, longitude: longitude).coordinate
    }
}

class StationInformation: Object, EntitySafe, Codable, Identifiable {
    @objc internal dynamic var _id: String = ""
    @objc internal dynamic var _name: String = ""
    @objc internal dynamic var _longitude: Double = 0
    @objc internal dynamic var _latitude: Double = 0
    @objc internal dynamic var _capacity: Int = 0
    @objc internal dynamic var _address: String = ""
    @objc internal dynamic var _isFavorite: Bool = false

    var status: StationStatus?

    override static func primaryKey() -> String? {
        return "_id"
    }

    enum CodingKeys: String, CodingKey {
        case _id = "station_id"
        case _name = "name"
        case _longitude = "lon"
        case _latitude = "lat"
        case _capacity = "capacity"
        case _address = "address"
    }
    
    var id: String {
        self.isInvalidated ? "" : _id
    }
    
    var name: String {
        self.isInvalidated ? "" : _name
    }
    
    var longitude: Double {
        self.isInvalidated ? 0 : _longitude
    }
    
    var latitude: Double {
        self.isInvalidated ? 0 : _latitude
    }
    
    var capacity: Int {
        self.isInvalidated ? 0 : _capacity
    }
    
    var address: String {
        self.isInvalidated ? "" : _address
    }
    
    var isFavorite: Bool {
        get {
            self.isInvalidated ? false : _isFavorite
        }
        set {
            if !self.isInvalidated {
                self.modify {
                    _isFavorite = newValue
                }
            }
        }
    }

    var displayName: String {
        let regex = try! NSRegularExpression(pattern: "[0-9]{3}\\s?-\\s?")
        let range = NSMakeRange(0, name.count)
        return regex.stringByReplacingMatches(in: name, options: [], range: range, withTemplate: "")
    }
    
    var annotation: StationAnnotation {
        return StationAnnotation(title: name, latitude: latitude, longitude: longitude)
    }
}
