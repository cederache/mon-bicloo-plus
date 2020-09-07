//
//  StationRow.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationStatusView: View {
    var stationInformation: StationInformation
    @State var withUnavailableDocks: Bool = false
    @State var withSpacers: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            if withSpacers {
                Spacer()
            }
            if stationInformation.status == nil {
                Text("-")
            } else {
                Group {
                    Text("\(stationInformation.status?.nbBikesAvailable ?? 0)")
                    Image(systemName: "v.circle")
                }
                .foregroundColor(stationInformation.status?.nbBikesAvailableColor ?? Color.primary)
                
                Group {
                    Text("\(stationInformation.status?.nbDocksAvailable ?? 0)")
                    Image(systemName: "p.circle")
                }
                .foregroundColor(stationInformation.status?.nbDocksAvailableColor ?? Color.primary)
                
                if withUnavailableDocks {
                    Group {
                        Text("\(stationInformation.nbDocksOoo)")
                        Image(systemName: "bolt.circle")
                    }
                    .foregroundColor(.yellow)
                }
            }
            
            if withSpacers {
                Spacer()
            }
        }
    }
}

struct StationRow: View {
    @Binding var stationInformation: StationInformation

    var body: some View {
        NavigationLink(destination: StationView(stationInformation: $stationInformation)) {
            HStack {
                Text(stationInformation.displayNameCapitalized)

                Spacer()
                
                StationStatusView(stationInformation: stationInformation)
            }
        }
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(stationInformation: .constant(StationInformation()))
    }
}
