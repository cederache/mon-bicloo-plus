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
    @State var firstStationsFetch: Bool = true
    
    let loopCallTime = 5.0;

    func fetchStationsAtStart() {
        if !firstStationsFetch {
            return
        }
        
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
            
            // Launch fetch status loop
            self.fetchStatus(true)
        }) { _ in
            logger.error("Can't fetch stations")
        }
    }
    
    func fetchStatus(_ loopCalls: Bool = false) {
        stationsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStationsStatus(onDone: { status in
            self.stationsStore.fetch()
            
            for station in self.stationsStore.stations {
                station.status = status.first(where: { $0.id == station.id })
            }
            
            self.showingRefreshView = false
            
            if loopCalls {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.loopCallTime, execute: {
                    self.fetchStatus(loopCalls)
                })
            }
        }) { _ in
            logger.error("Can't fetch status")
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
                            stationInformation.isFavorite.toggle()
                            stationInformation.save()
                            self.stationsStore.fetch()
                        })
                    }
                }

                NavigationLink(destination: ListStationsView().environmentObject(self.stationsStore)) {
                    Text("Voir toutes les stations")
                }
            }
            .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                self.fetchStatus()
            })
            .onAppear {
                self.fetchStationsAtStart()
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
