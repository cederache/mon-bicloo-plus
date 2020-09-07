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
    @EnvironmentObject var stationsGroupsStore: StationsGroupsStore

    @State var searchQuery: String = ""
    @State var showingRefreshView: Bool = false
    @State var firstStationsFetch: Bool = true
    @State var stationsGroupViewPresented: Bool = false

    let loopCallTime = 5.0

    func fetchStationsAtStart() {
        if !firstStationsFetch {
            return
        }

        stationsStore.fetch()
        stationsGroupsStore.fetch()
        showingRefreshView = true
        ServerManager.Instance.FetchStations(onDone: { stations in
            for station in stations {
                station.save()
            }

            self.stationsStore.fetch()
            self.stationsGroupsStore.fetch()

            for station in stations {
                self.stationsStore.stationInformations.first(where: { $0.id == station.id })?.status = station.status
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

            for stationInformation in self.stationsStore.stationInformations {
                stationInformation.status = status.first(where: { $0.id == stationInformation.id })
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

    func stationsGroupRow(_ stationsGroup: StationsGroup) -> some View {
        if searchQuery != "" && stationsGroup.stations
            .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) }).count == 0 {
            return HStack {
                Spacer()
                Text("Aucune station ne correspond à votre recherche")
                    .italic()
                Spacer()
            }
            .eraseToAnyView()
        } else if stationsGroup.stations.count == 0 {
            return HStack {
                Spacer()
                Text("Aucune station dans ce groupe")
                    .italic()
                Spacer()
            }
            .eraseToAnyView()
        } else {
            return ForEach(stationsGroup.stations
                .filter({ (searchQuery == "" || $0.name.lowercased().contains(searchQuery.lowercased())) })
                .sorted(by: {
                    $0.displayName < $1.displayName
                })
            ) { (stationInformation: StationInformation) in
                StationRow(stationInformation: self.$stationsStore.stationInformations[self.stationsStore.stationInformations.firstIndex(of: stationInformation) ?? 0])
            }
            .eraseToAnyView()
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchQuery: $searchQuery)

                List {
                    if stationsGroupsStore.stationsGroups.count == 0 {
                        HStack {
                            Spacer()
                            Text("Aucun groupe n'est défini")
                                .italic()
                                .onTapGesture {
                                    self.stationsGroupViewPresented = true
                                }
                            Spacer()
                        }
                    } else {
                        ForEach(stationsGroupsStore.stationsGroups) { stationsGroup in
                            Section(header: Text(stationsGroup.name)) {
                                self.stationsGroupRow(stationsGroup)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .sheet(isPresented: $stationsGroupViewPresented) {
                    StationsGroupsView(canEdit: true)
                        .environmentObject(self.stationsGroupsStore)
                        .accentColor(Constants.accentColor)
                }

                NavigationLink(destination: ListStationsView().environmentObject(self.stationsStore)) {
                    Text("Voir toutes les stations")
                }
            }
            .pullToRefresh(isShowing: self.$showingRefreshView, onRefresh: {
                self.fetchStatus()
                self.stationsGroupsStore.fetch()
            })
            .onAppear {
                self.fetchStationsAtStart()
            }
            .navigationBarTitle("Stations favorites")
            .navigationBarItems(trailing: Button(action: {
                self.stationsGroupViewPresented = true
            }) {
                HStack {
                    Image(systemName: "gear")
                    Text("Groupes")
                }
            })
        }
    }
}

struct FavoritesStations_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesStationsView()
    }
}
