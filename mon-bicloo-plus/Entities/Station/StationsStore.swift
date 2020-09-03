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

    @Published var stationInformations: [StationInformation] = []

    private init() {}

    func fetch() {
        let tmpStations = stationInformations
        stationInformations = DatabaseManager.Instance.realm.objects(StationInformation.self).toArray(ofType: StationInformation.self)
        
        // Retrieve previous status from stations
        for station in stationInformations {
            let tmpStation = tmpStations.first(where: { $0.id == station.id })
            station.status = tmpStation?.status
            station.save()
        }
    }
}
