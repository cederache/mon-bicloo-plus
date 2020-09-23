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
        var stations = Station.getAll() as? [Station] ?? []
        var stationsToRemove: [Station] = []
        
        if stationStatus.count == 0 {
            stationStatus = stations
        } else {
            for station in stationStatus {
                let newStationIndex = stations.firstIndex(where: { $0.id == station.id })
                
                if let stationIndex = newStationIndex {
                    station.mergeWithNewStation(stations[stationIndex])
                    stations.remove(at: stationIndex)
                } else {
                    stationsToRemove.append(station)
                }
            }
            
            for stationToRemove in stationsToRemove {
                stationStatus.removeAll(where: { $0.id == stationToRemove.id })
            }
            
            for newStation in stations {
                stationStatus.append(newStation)
            }
        }
    }
}
