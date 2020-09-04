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
    @State var loadingMapView: Bool = true

    @State var displayMode: DisplayMode = .List

    enum DisplayMode {
        case List
        case Map
    }

    func fetchStatus() {
        stationsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStationsStatus(onDone: { status in
            self.stationsStore.fetch()

            for station in self.stationsStore.stationInformations {
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

            if displayMode == .List {
                List {
                    if self.searchQuery != "" && self.stationsStore.stationInformations
                        .filter({ searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased()) }).count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station ne correspond à votre recherche")
                                .italic()
                                .disabled(true)
                            Spacer()
                        }
                    } else if self.stationsStore.stationInformations.count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucune station à afficher")
                                .italic()
                            Spacer()
                        }
                    }

                    ForEach(self.stationsStore.stationInformations
                        .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                        .sorted(by: {
                            $0.displayName < $1.displayName
                        })
                    ) { (stationInformation: StationInformation) in
                        StationRow(stationInformation: self.$stationsStore.stationInformations[self.stationsStore.stationInformations.firstIndex(of: stationInformation) ?? 0])
                    }
                }
                .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                    self.fetchStatus()
                })
                .transition(.move(edge: .leading))
            } else if displayMode == .Map {
                ZStack {
                    MapView(checkpoints: self.stationsStore.stationInformations
                        .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                        .map({ $0.annotation }), loadingMapView: $loadingMapView, showCallout: true, showDisplayModeSwitch: true)
                        .onAppear {
                            self.showStation = false
                        }

                    if loadingMapView {
                        ActivityIndicator(isAnimating: .constant(true))
                    }
                }
                .transition(.move(edge: .trailing))
            }
        }
        .onAppear {
            self.fetchStatus()
        }
        .navigationBarTitle("Toutes les stations")
        .navigationBarItems(trailing:
            Button(action: {
                withAnimation {
                    self.displayMode = self.displayMode == .List ? .Map : .List
                }
            }) {
                Image(systemName: self.displayMode == .List ? "map.fill" : "list.bullet")
            }
        )
        .edgesIgnoringSafeArea([.bottom])
    }
}

struct ListStations_Previews: PreviewProvider {
    static var previews: some View {
        ListStationsView()
            .environmentObject(StationsStore.Instance)
    }
}
