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
    @Binding var stations: [StationInformation]

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
        VStack {
            SearchBar(searchQuery: $searchQuery)

            List {
                if self.searchQuery != "" && self.stations
                    .filter({ searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased()) }).count == 0 {
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
                    .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
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

struct ListStations_Previews: PreviewProvider {
    static var previews: some View {
        ListStationsView(stations: .constant([StationInformation()]))
    }
}
