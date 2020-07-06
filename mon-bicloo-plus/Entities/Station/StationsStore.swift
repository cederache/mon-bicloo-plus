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

    @Published var stations: [StationInformation] = []

    private init() {}

    func fetch() {
        stations = DatabaseManager.Instance.realm.objects(StationInformation.self).toArray(ofType: StationInformation.self)
/*        let tmpStations = stations
        for station in stations {
            let tmpStation = tmpStations.first(where: { $0.id == station.id })
            station.status = tmpStation?.status
            station.isFavorite = tmpStation?.isFavorite ?? false
            station.save()
        }*/
    }
}
