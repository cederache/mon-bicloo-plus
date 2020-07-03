//
//  FavoritesStations.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

import SwiftUIRefresh

struct FavoritesStationsView: View {
    @State var stations: [StationInformation] = []

    @State var searchQuery: String = ""
    @State var showingRefreshView: Bool = false
    @State var expandAllStationsList: Bool = false

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
                    if self.stations.filter({ $0.isFavorite }).count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station favorite")
                                .italic()
                                .disabled(true)
                            Spacer()
                        }
                    } else if self.searchQuery != "" && self.stations
                        .filter({ $0.isFavorite && (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) }).count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station ne correspond à votre recherche")
                                .italic()
                                .disabled(true)
                            Spacer()
                        }
                    } else if self.stations.count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station à afficher")
                                .italic()
                            Spacer()
                        }
                    }

                    ForEach(self.stations
                        .filter({ $0.isFavorite && (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                        .sorted(by: {
                            $0.displayName < $1.displayName
                        })
                    ) { (stationInformation: StationInformation) in
                        StationRow(stationInformation: self.$stations[self.stations.firstIndex(of: stationInformation) ?? 0], onTap: {
                            if let stationIndex = self.stations.firstIndex(of: stationInformation) {
                                self.stations[stationIndex].isFavorite.toggle()
                            }
                        })
                    }
                }

                NavigationLink(destination: ListStationsView(stations: self.$stations)) {
                    Text("Voir toutes les stations")
                }
            }
            .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                self.fetchStations()
            })
            .onAppear {
                self.fetchStations()
            }
            .navigationBarTitle("Stations favorites")
        }
    }
}

struct FavoritesStations_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesStationsView()
    }
}
