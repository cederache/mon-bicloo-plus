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

    @State var fetchError: Bool = false

    let loopCallTime = 5.0

    func fetchStationsAtStart() {
        if !firstStationsFetch {
            return
        }

        stationsStore.fetch()
        stationsGroupsStore.fetch()
        showingRefreshView = true

        // Launch fetch status loop
        fetchStatus(loop: true)
    }

    func fetchStatus(loop loopCalls: Bool = false) {
        stationsStore.fetch()
        showingRefreshView = !loopCalls

        ServerManager.Instance.FetchStationsStatus(onDone: { _ in
            self.fetchError = false
            self.showingRefreshView = false

            stationsStore.fetch()
            self.stationsGroupsStore.fetch()

            if loopCalls {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.loopCallTime, execute: {
                    self.fetchStatus(loop: true)
                })
            }
        }) { _ in
            self.fetchError = true
            logger.error("Can't fetch stations status")
        }
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
                                StationGroupRow(stationsGroup: stationsGroup, searchQuery: self.searchQuery)
                                    .environmentObject(self.stationsStore)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .sheet(isPresented: $stationsGroupViewPresented) {
                    StationsGroupsView(canEdit: true)
                        .environmentObject(self.stationsGroupsStore)
                        .accentColor(Constants.accentColor)
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
                        Image(systemName: "gear", iOS14SystemName: "gearshape.2.fill")
                        Text("Groupes")
                    }
                })
            }
        }
    }
}

struct FavoritesStations_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesStationsView()
    }
}
