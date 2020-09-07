//
//  StationView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 03/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import MapKit
import SwiftUI

struct StationView: View {
    @EnvironmentObject var stationsStore: StationsStore
    @EnvironmentObject var stationsGroupStore: StationsGroupsStore

    @Binding var stationInformation: StationInformation
    @State var loadingMapView: Bool = true
    @State var stationsGroupViewPresented: Bool = false

    @State var showActionSheet: Bool = false

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
                    .accentColor(Constants.accentColor)
            }

            Button(action: {
                self.showActionSheet = true
            }) {
                Text("Aller à la station")
            }
            .actionSheet(isPresented: $showActionSheet) {
                var buttons: [Alert.Button] = [
                    .cancel {},
                    .default(Text("Apple Plans")) {
                        let coordinate = CLLocationCoordinate2DMake(self.stationInformation.latitude, self.stationInformation.longitude)
                        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
                        mapItem.name = self.stationInformation.name
                        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking])
                    }]

                if let url = URL(string:
                    "comgooglemaps://?saddr=&daddr=\(self.stationInformation.latitude),\(self.stationInformation.longitude)&directionsmode=walking"),  UIApplication.shared.canOpenURL(url) {
                    buttons.append(.default(Text("Google Maps")) {
                        UIApplication.shared.open(url)
                    })
                }

                return ActionSheet(title: Text("Aller à la station"), buttons: buttons)
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
