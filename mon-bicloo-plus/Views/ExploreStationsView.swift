//
//  ContentView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct ExploreStationsView: View {
    @State var stations: [Station] = []
    @State var favoritesStations: [Station] = []

    func toggleFavorite(_ station: Station) {
        if let favIndex = favoritesStations.firstIndex(where: { $0.id == station.id }) {
            favoritesStations.remove(at: favIndex)
        } else {
            favoritesStations.append(station)
            favoritesStations = favoritesStations.sorted(by: { $0.displayName < $1.displayName })
        }
    }

    func isFavorite(_ station: Station) -> Bool {
        favoritesStations.firstIndex(where: { $0.id == station.id }) != nil
    }

    var body: some View {
        VStack {
            List {
                ForEach(self.stations.sorted(by: {
                    $0.displayName < $1.displayName
                })) { station in
                    Button(action: {
                        logger.debug("Should show more infos about the station \(station.name)")
                    }) {
                        HStack {
                            Text(station.displayName)
                            
                            Spacer()
                            
                            Image(systemName: self.isFavorite(station) ? "star.fill" : "star")
                                .onTapGesture {
                                    self.toggleFavorite(station)
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
    }
}

struct Stations_Previews: PreviewProvider {
    static var previews: some View {
        ExploreStationsView()
    }
}
