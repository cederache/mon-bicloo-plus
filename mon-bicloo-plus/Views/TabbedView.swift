//
//  TabView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct TabbedView: View {
    @State var selection: Int = 0

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                RidesView()
                    .tabItem {
                    Image(systemName: "flag")
                        .font(.system(size: 25))
                    Text("Trajets")
                }.tag(0)
                
                ExploreStationsView()
                    .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25))
                    Text("Stations")
                }.tag(1)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
