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

    @State var selectedStation: Station = Station()
    @State var showStation: Bool = false
    
    @State var fetchError: Bool = false
    
    enum DisplayMode {
        case List
        case Map
    }

    func fetchStatus() {
        stationsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStationsStatus(onDone: { status in
            self.fetchError = false
            self.stationsStore.fetch()

            self.showingRefreshView = false
        }) { _ in
            self.fetchError = true
            logger.error("Can't fetch status")
        }
    }
    
    var filteredStations: [Station] {
        stationsStore.stationStatus
            .filter({ (searchQuery == "" || $0.displayNameCapitalized.lowercased().contains(searchQuery.lowercased())) })
            .sorted(by: {
                $0.displayNameCapitalized.localizedCaseInsensitiveCompare($1.displayNameCapitalized) == ComparisonResult.orderedAscending
            })
    }

    var body: some View {
        NavigationView {
            VStack {
                if fetchError {
                    HStack {
                        Text("Une erreur est survenue lors de la récupération des données")
                            .font(.caption)
                            .italic()
                            .multilineTextAlignment(.center)
                    }
                    .padding([.top, .bottom], 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                }
                
                SearchBar(searchQuery: $searchQuery)

                if displayMode == .List {
                    List {
                        if self.searchQuery != "" && self.filteredStations.count == 0 {
                            HStack {
                                Spacer()
                                Text("Aucune station ne correspond à votre recherche")
                                    .italic()
                                    .disabled(true)
                                Spacer()
                            }
                        } else if self.stationsStore.stationStatus.count == 0 {
                            HStack {
                                Spacer()
                                Text("Aucune station à afficher")
                                    .italic()
                                Spacer()
                            }
                        }
                        
                        ForEach(self.filteredStations) { (station: Station) in
                            NavigationLink(destination: StationView(station: self.$stationsStore.stationStatus[self.stationsStore.stationStatus.firstIndex(of: station) ?? 0])) {
                                StationRow(station: self.$stationsStore.stationStatus[self.stationsStore.stationStatus.firstIndex(of: station) ?? 0])
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                        self.fetchStatus()
                    })
                    .transition(.move(edge: .leading))
                } else if displayMode == .Map {
                    ZStack {
                        NavigationLink(destination: StationView(station: $selectedStation), isActive: $showStation) {
                            EmptyView()
                        }
                        .hidden()

                        MapView(checkpoints: self.stationsStore.stationStatus
                            .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                            .map({ $0.annotation }), loadingMapView: $loadingMapView, showCallout: true, showDisplayModeSwitch: true, showStation: { (station: Station) in
                                self.selectedStation = station
                                self.showStation = true
                            })
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
                    HStack {
                        Image(systemName: self.displayMode == .List ? "map.fill" : "list.bullet")
                        Text(self.displayMode == .List ? "Carte" : "Liste")
                    }
                }
            )
            .edgesIgnoringSafeArea([.bottom])
        }
    }
}

struct ListStations_Previews: PreviewProvider {
    static var previews: some View {
        ListStationsView()
            .environmentObject(StationsStore.Instance)
    }
}
