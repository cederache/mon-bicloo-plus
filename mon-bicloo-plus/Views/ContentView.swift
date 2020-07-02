//
//  ContentView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationsView: View {
    @State var stations: [Station] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(self.stations.sorted(by: {
                    $0.name > $1.name
                })) { (station) in
                    Text(station.name)
                }
            }
        }
        .onAppear {
            ServerManager.Instance.FetchStations(onDone: { (stations) in
                self.stations = stations
            }) { (error) in
                logger.error("Can't fetch stations")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView()
    }
}
