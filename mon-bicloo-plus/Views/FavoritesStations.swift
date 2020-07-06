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
    @EnvironmentObject var stationsStore: StationsStore
    
    @State var searchQuery: String = ""
    @State var showingRefreshView: Bool = false
    @State var expandAllStationsList: Bool = false

    func fetchStations() {
        stationsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStations(onDone: { stations in
            for station in stations {
                station.save()
            }
            
            self.stationsStore.fetch()
            
            for station in stations {
                self.stationsStore.stations.first(where: { $0.id == station.id })?.status = station.status
            }
            
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
                    if self.stationsStore.stations.filter({ $0.isFavorite }).count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station favorite")
                                .italic()
                                .disabled(true)
                            Spacer()
                        }
                    } else if self.searchQuery != "" && self.stationsStore.stations
                        .filter({ $0.isFavorite && (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) }).count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station ne correspond à votre recherche")
                                .italic()
                                .disabled(true)
                            Spacer()
                        }
                    } else if self.stationsStore.stations.count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station à afficher")
                                .italic()
                            Spacer()
                        }
                    }

                    ForEach(self.stationsStore.stations
                        .filter({ $0.isFavorite && (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                        .sorted(by: {
                            $0.displayName < $1.displayName
                        })
                    ) { (stationInformation: StationInformation) in
                        StationRow(stationInformation: self.$stationsStore.stations[self.stationsStore.stations.firstIndex(of: stationInformation) ?? 0], onTap: {
                            if let stationIndex = self.stationsStore.stations.firstIndex(of: stationInformation) {
                                self.stationsStore.stations[stationIndex].isFavorite.toggle()
                            }
                        })
                    }
                }

                NavigationLink(destination: ListStationsView().environmentObject(self.stationsStore)) {
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
