//
//  StationsTabView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 17/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationsTabView: View {
    @EnvironmentObject var stationsStore: StationsStore
    @EnvironmentObject var stationsGroupStore: StationsGroupsStore
    @State private var selection = 1

    var body: some View {
        TabView {
            FavoritesStationsView()
                .tabItem {
                    Image(systemName: "star.fill")
                        .font(.system(size: 25))
                    Text("Favoris")
                }
                .tag(1)

            ListStationsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25))
                    Text("Rechercher")
                }
                .tag(2)
        }
    }
}

struct StationsTabView_Previews: PreviewProvider {
    static var previews: some View {
        StationsTabView()
    }
}
