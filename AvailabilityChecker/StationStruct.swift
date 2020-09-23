//
//  Station.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 22/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import SwiftUI

struct StationsRecords: Codable {
    var records: [StaticStation]

    enum CodingKeys: String, CodingKey {
        case records
    }
}

struct StaticStation: Codable {
    var fields: StationStruct

    enum CodingKeys: String, CodingKey {
        case fields
    }
}

struct StationStruct: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var capacity: Int = 0
    var nbDocksAvailable: Int = 0
    var nbBikesAvailable: Int = 0

    enum CodingKeys: String, CodingKey {
        case id = "number"
        case name = "name"
        case capacity = "bike_stands"
        case nbDocksAvailable = "available_bike_stands"
        case nbBikesAvailable = "available_bikes"
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
    
    var url: URL? {
        return URL(string: "stations/\(id)")
    }
}
