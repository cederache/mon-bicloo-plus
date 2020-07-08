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
    @Binding var stationInformation: StationInformation
    @State var loadingMapView: Bool = true

    var body: some View {
        VStack {
            HStack {
                Text(stationInformation.displayName)
                    .font(.largeTitle)
                Spacer()
            }

            HStack {
                Spacer()

                if stationInformation.status == nil {
                    Text("-")
                } else {
                    HStack {
                        Text("\(stationInformation.status?.nbBikesAvailable ?? 0)")
                        Image(systemName: "v.circle")
                            .padding(.trailing, 10)

                        Text("\(stationInformation.status?.nbDocksAvailable ?? 0)")
                        Image(systemName: "p.circle")
                    }
                    .font(.headline)
                }

                Spacer()

                Button(action: {
                    self.stationInformation.isFavorite.toggle()
                    self.stationInformation.save()
                    self.stationsStore.fetch()
                }) {
                    Image(systemName: self.stationInformation.isFavorite ? "star.fill" : "star")
                        .foregroundColor(self.stationInformation.isFavorite ? .yellow : .blue)
                }

                Spacer()
            }

            Text(stationInformation.address)
                .padding(.bottom, 10)

            ZStack {
                MapView(checkpoints: [self.stationInformation.annotation], loadingMapView: $loadingMapView)
                
                if loadingMapView {
                    ActivityIndicator(isAnimating: .constant(true))
                }
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
