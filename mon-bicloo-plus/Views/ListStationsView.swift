//
//  ContentView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct ListStationsView: View {
    @State var stations: [StationInformation] = []
    @State var favoritesStations: [StationInformation] = []

    func toggleFavorite(_ station: StationInformation) {
        if let favIndex = favoritesStations.firstIndex(where: { $0.id == station.id }) {
            favoritesStations.remove(at: favIndex)
        } else {
            favoritesStations.append(station)
            favoritesStations = favoritesStations.sorted(by: { $0.displayName < $1.displayName })
        }
    }

    func isFavorite(_ station: StationInformation) -> Bool {
        favoritesStations.firstIndex(where: { $0.id == station.id }) != nil
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.stations.sorted(by: {
                        $0.displayName < $1.displayName
                    })) { (stationInformation: StationInformation) in
                        NavigationLink(destination: StationView(stationInformation: stationInformation)) {
                            HStack {
                                Text(stationInformation.displayName)

                                Spacer()

                                if stationInformation.status == nil {
                                    Text("-")
                                    Text("-")
                                } else {
                                    Text("\(stationInformation.status?.nbBikesAvailable ?? 0)")
                                    Text("\(stationInformation.status?.nbDocksAvailable ?? 0)")
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                ServerManager.Instance.FetchStations(onDone: { stations in
                    self.stations = stations
                }) { _ in
                    logger.error("Can't fetch stations")
                }
            }
            .navigationBarTitle("Stations")
        }
    }
}

struct Stations_Previews: PreviewProvider {
    static var previews: some View {
        ListStationsView()
    }
}
