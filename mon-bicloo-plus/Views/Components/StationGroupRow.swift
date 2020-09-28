//
//  StationGroupRow.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 28/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationGroupRow: View {
    @EnvironmentObject var stationsStore: StationsStore
    
    var stationsGroup: StationsGroup
    var searchQuery: String = ""
    
    var body: some View {
        if searchQuery != "" && stationsGroup.stations
            .filter({ (searchQuery == "" || $0.displayNameCapitalized.lowercased().contains(searchQuery.lowercased())) })
            .sorted(by: {
                $0.displayNameCapitalized.localizedCaseInsensitiveCompare($1.displayNameCapitalized) == ComparisonResult.orderedAscending
            }).count == 0 {
            HStack {
                Spacer()
                Text("Aucune station ne correspond à votre recherche")
                    .italic()
                Spacer()
            }
            .eraseToAnyView()
        } else if stationsGroup.stations.count == 0 {
            HStack {
                Spacer()
                Text("Aucune station dans ce groupe")
                    .italic()
                Spacer()
            }
            .eraseToAnyView()
        } else {
            ForEach(stationsGroup.stations
                .filter({ (searchQuery == "" || $0.displayNameCapitalized.lowercased().contains(searchQuery.lowercased())) })
                .sorted(by: {
                    $0.displayNameCapitalized.localizedCaseInsensitiveCompare($1.displayNameCapitalized) == ComparisonResult.orderedAscending
                })) { (station: Station) in
                NavigationLink(destination: StationView(station: station)) {
                    StationRow(station: station)
                }
            }
            .eraseToAnyView()
        }
    }
}

struct StationGroupRow_Previews: PreviewProvider {
    static var previews: some View {
        StationGroupRow(stationsGroup: StationsGroup(name: "Test"))
    }
}
