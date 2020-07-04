//
//  Station.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

struct StationsStatus: Codable {
    var ttl: Double
    var lastUpdate: Double
    var data: StaticStationsStatus

    enum CodingKeys: String, CodingKey {
        case ttl
        case lastUpdate = "last_updated"
        case data
    }
}

struct StaticStationsStatus: Codable {
    var stationsStatus: [StationStatus]

    enum CodingKeys: String, CodingKey {
        case stationsStatus = "stations"
    }
}

struct StationStatus: Codable, Identifiable, Equatable {
    var id: String
    var nbDocksAvailable: Int
    var nbBikesAvailable: Int
    var lastReported: Double
    var isReturning: Int
    var isRenting: Int
    var isInstalled: Int

    enum CodingKeys: String, CodingKey {
        case id = "station_id"
        case nbDocksAvailable = "num_docks_available"
        case nbBikesAvailable = "num_bikes_available"
        case lastReported = "last_reported"
        case isReturning = "is_returning"
        case isRenting = "is_renting"
        case isInstalled = "is_installed"
    }
}
