//
//  Constants.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import SwiftUI

class Constants {
    // MARK: - Instance

    static let Instance = Constants()
    private(set) static var accentColor: Color = .orange
    private(set) static var stationDataSetURL = "https://data.nantesmetropole.fr/api/records/1.0/search/?dataset=244400404_stations-velos-libre-service-nantes-metropole-disponibilites&q=&rows=999"
}
