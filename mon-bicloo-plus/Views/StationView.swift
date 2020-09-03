//
//  StationView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 03/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationView: View {
    @EnvironmentObject var stationsStore: StationsStore
    @EnvironmentObject var stationsGroupStore: StationsGroupsStore
    
    @Binding var stationInformation: StationInformation
    @State var loadingMapView: Bool = true
    @State var stationsGroupViewPresented: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text(stationInformation.displayName)
                    .font(.largeTitle)
                Spacer()
            }

            StationStatusView(stationInformation: stationInformation, withUnavailableDocks: true, withSpacers: true)

            Button(action: {
                self.stationsGroupViewPresented = true
            }) {
                Text("Ajouter dans un groupe")
            }

            ZStack {
                MapView(checkpoints: [self.stationInformation.annotation], loadingMapView: $loadingMapView)
                
                if loadingMapView {
                    ActivityIndicator(isAnimating: .constant(true))
                }
            }
            .sheet(isPresented: $stationsGroupViewPresented) {
                StationsGroupsView(canEdit: false, onStationsGroupSelected: { stationsGroupSelected in
                    if stationsGroupSelected.stations.firstIndex(of: self.stationInformation) != nil {
                        stationsGroupSelected.removeStation(self.stationInformation)
                    } else {
                        stationsGroupSelected.addStation(self.stationInformation)
                    }
                    stationsGroupSelected.save()
                    self.stationsGroupViewPresented = false
                })
                    .environmentObject(self.stationsGroupStore)
            }
        }
        .padding(10)
        .navigationBarTitle("Station")
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(stationInformation: .constant(StationInformation()))
            .environmentObject(StationsStore.Instance)
    }
}
