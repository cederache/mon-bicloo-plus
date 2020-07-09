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
    @EnvironmentObject var stationsStore: StationsStore

    @State var searchQuery: String = ""
    @State var showingRefreshView: Bool = false

    func fetchStatus() {
        stationsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStationsStatus(onDone: { status in
            self.stationsStore.fetch()
            
            for station in self.stationsStore.stations {
                station.status = status.first(where: { $0.id == station.id })
            }
            
            self.showingRefreshView = false
        }) { _ in
            logger.error("Can't fetch status")
        }
    }

    var body: some View {
        VStack {
            SearchBar(searchQuery: $searchQuery)

            List {
                if self.searchQuery != "" && self.stationsStore.stations
                    .filter({ searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased()) }).count == 0 {
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
                    .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                    .sorted(by: {
                        $0.displayName < $1.displayName
                    })
                ) { (stationInformation: StationInformation) in
                    StationRow(stationInformation: self.$stationsStore.stations[self.stationsStore.stations.firstIndex(of: stationInformation) ?? 0])
                }
            }
        }
        .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
            self.fetchStatus()
        })
        .onAppear {
            self.fetchStatus()
        }
        .navigationBarTitle("Toutes les stations")
    }
}

struct ListStations_Previews: PreviewProvider {
    static var previews: some View {
        ListStationsView()
            .environmentObject(StationsStore.Instance)
    }
}
