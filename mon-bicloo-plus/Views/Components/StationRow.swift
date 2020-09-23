//
//  StationRow.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationStatusView: View {
    var station: Station
    @State var withUnavailableDocks: Bool = false
    @State var withSpacers: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            if withSpacers {
                Spacer()
            }
            Group {
                Text("\(station.nbBikesAvailable)")
                    .frame(minWidth: 20, alignment: .trailing)
                
                Image(systemName: "v.circle", iOS14SystemName: "bicycle")
            }
            .foregroundColor(station.nbBikesAvailableColor)
            
            Group {
                Text("\(station.nbDocksAvailable)")
                    .frame(minWidth: 20, alignment: .trailing)
                
                Image(systemName: "p.circle")
            }
            .foregroundColor(station.nbDocksAvailableColor)
            
            if withUnavailableDocks {
                Group {
                    Text("\(station.nbDocksOoo)")
                        .frame(minWidth: 20, alignment: .trailing)
                    
                    Image(systemName: "bolt.circle")
                }
                .foregroundColor(.yellow)
            }
            
            if withSpacers {
                Spacer()
            }
        }
    }
}

struct StationRow: View {
    @Binding var station: Station

    var body: some View {
        HStack {
            Text(station.displayNameCapitalized)

            Spacer()
            
            StationStatusView(station: station)
        }
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(station: .constant(Station()))
    }
}
