//
//  StationView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 03/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationView: View {
    @Binding var stationInformation: StationInformation

    var body: some View {
        VStack {
            Spacer()

            Text(stationInformation.displayName)

            Spacer()

            Text(stationInformation.address)

            Spacer()

            if stationInformation.status == nil {
                Text("Chargement...")
            } else {
                Text("\(stationInformation.status!.nbBikesAvailable) vélo(s) disponible(s)")
                Text("\(stationInformation.status!.nbDocksAvailable) place(s) disponible(s)")
            }

            Spacer()

            Button(action: {
                self.stationInformation.isFavorite.toggle()
                self.stationInformation.save()
            }) {
                VStack {
                    Image(systemName: "star")

                    Text("Ajouter aux favoris")
                }
            }

            Spacer()
        }
        .navigationBarTitle(stationInformation.name)
    }
}

//
// struct StationView_Previews: PreviewProvider {
//    static var previews: some View {
//        StationView (stationInformation: StationInformation(id: "id", name: "name", longitude: 0, latitude: 0, capacity: 0, address: "address"))
//    }
// }
