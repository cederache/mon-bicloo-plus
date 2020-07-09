//
//  StationRow.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationRow: View {
    @Binding var stationInformation: StationInformation

    var body: some View {
        NavigationLink(destination: StationView(stationInformation: $stationInformation)) {
            HStack {
                Text(stationInformation.displayName)

                Spacer()

                if stationInformation.status == nil {
                    Text("-")
                } else {
                    Text("\(stationInformation.status?.nbBikesAvailable ?? 0)")
                    Image(systemName: "v.circle")
                        .padding(.trailing, 10)

                    Text("\(stationInformation.status?.nbDocksAvailable ?? 0)")
                    Image(systemName: "p.circle")
                }
            }
        }
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(stationInformation: .constant(StationInformation()))
    }
}
