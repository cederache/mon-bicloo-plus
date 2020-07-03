//
//  ContentView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ListStationsView: View {
    @State var stations: [StationInformation] = []
    @State var favoritesStations: [StationInformation] = []
    @State var searchQuery: String = ""
    @State var showingRefreshView: Bool = false

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
    
    func fetchStations() {
        showingRefreshView = true
        ServerManager.Instance.FetchStations(onDone: { stations in
            self.stations = stations
            self.showingRefreshView = false
        }) { _ in
            logger.error("Can't fetch stations")
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchQuery: $searchQuery)

                List {
                    ForEach(self.stations
                        .filter({ searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased()) })
                        .sorted(by: {
                            $0.displayName < $1.displayName
                        })
                    ) { (stationInformation: StationInformation) in
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
            .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                self.fetchStations()
            })
            .onAppear {
                self.fetchStations()
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
