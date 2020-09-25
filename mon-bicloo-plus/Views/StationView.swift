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

    @Binding var station: Station
    @State var loadingMapView: Bool = true
    @State var stationsGroupViewPresented: Bool = false

    @State var showActionSheet: Bool = false

    var body: some View {
        VStack {
            ZStack {
                MapView(checkpoints: [self.station.annotation], loadingMapView: $loadingMapView)

                if loadingMapView {
                    ActivityIndicator(isAnimating: .constant(true))
                }
            }
            .sheet(isPresented: $stationsGroupViewPresented) {
                StationsGroupsView(canEdit: false, selectedStation: self.station, onStationsGroupSelected: { stationsGroupSelected in
                    if stationsGroupSelected.stations.firstIndex(of: self.station) != nil {
                        stationsGroupSelected.removeStation(self.station)
                    } else {
                        stationsGroupSelected.addStation(self.station)
                    }
                    stationsGroupSelected.save()
                    self.stationsGroupViewPresented = false
                })
                    .environmentObject(self.stationsGroupStore)
                    .accentColor(Constants.accentColor)
            }
            
            Text(station.displayName)
                .font(.largeTitle)

            StationStatusView(station: station, withUnavailableDocks: true, withSpacers: true)
                .padding([.top, .bottom], 10)
            
            HStack {
                Spacer()
                
                Button(action: {
                    self.stationsGroupViewPresented = true
                }) {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Ajouter au favoris")
                    }
                }
                
                Spacer()

                Button(action: {
                    self.showActionSheet = true
                }) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Aller à la station")
                    }
                }
                .actionSheet(isPresented: $showActionSheet) {
                    var buttons: [Alert.Button] = [
                        .cancel {},
                        .default(Text("Apple Plans")) {
                            let coordinate = CLLocationCoordinate2DMake(self.station.latitude, self.station.longitude)
                            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
                            mapItem.name = self.station.name
                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking])
                        }]

                    if let url = URL(string:
                        "comgooglemaps://?saddr=&daddr=\(self.station.latitude),\(self.station.longitude)&directionsmode=walking"),  UIApplication.shared.canOpenURL(url) {
                        buttons.append(.default(Text("Google Maps")) {
                            UIApplication.shared.open(url)
                        })
                    }

                    return ActionSheet(title: Text("Aller à la station"), buttons: buttons)
                }
                
                Spacer()
            }
            .padding([.bottom], 15)
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
        .padding(10)
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(station: .constant(Station()))
            .environmentObject(StationsStore.Instance)
    }
}
