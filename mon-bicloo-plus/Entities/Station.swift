//
//  Station.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

struct StationInformation: Codable {
    var ttl: Double
    var lastUpdate: Double
    var data: StaticStations
    
    enum CodingKeys: String, CodingKey {
        case ttl
        case lastUpdate = "last_updated"
        case data
    }
}

struct StaticStations: Codable {
    var stations: [Station]
}

struct Station: Codable, Identifiable {
    var id: String
    var name: String
    var longitude: Double
    var latitude: Double
    var capacity: Int
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case id = "station_id"
        case name
        case longitude = "lon"
        case latitude = "lat"
        case capacity
        case address
    }
    
    var displayName: String {
        let regex = try! NSRegularExpression(pattern: "[0-9]{3}\\s?-\\s?")
        let range = NSMakeRange(0, name.count)
        return regex.stringByReplacingMatches(in: name, options: [], range: range, withTemplate: "")
    }
}
