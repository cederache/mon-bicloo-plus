//
//  StationStore.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 05/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

class StationsStore: ObservableObject {
    static let Instance = StationsStore()

    @Published var stationStatus: [Station] = []

    private init() {}

    func fetch() {
        stationStatus = Station.getAll() as? [Station] ?? []
    }
}
