//
//  StationRow.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationRow: View {
    var station: Station
    @State var withUnavailableDocks: Bool = false

    var body: some View {
        NavigationLink(destination: StationView(station: station)) {
            GroupBox(label: Text(station.displayNameCapitalized)) {
                StationStatusView(station: station, withUnavailableDocks: withUnavailableDocks)
            }
        }
        .isDetailLink(true)
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(station: Station())
    }
}
