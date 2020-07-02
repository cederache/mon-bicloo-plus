//
//  Rides.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 30/06/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationItemView: View {
    @State var station: Station

    var body: some View {
        VStack {
            Text(station.name)

            HStack {
                HStack {
                    Text("0")
                    Image(systemName: "car")
                }
                Spacer()
                HStack {
                    Text("0")
                    Image(systemName: "p.circle")
                }
            }
        }
    }
}

struct AddStationItemView: View {
    var body: some View {
        VStack {
            Text("Ajouter une station")
            Image(systemName: "plus")
        }
    }
}

struct RidesView: View {
    @State var startStation: Station?
    @State var endStation: Station?

    var body: some View {
        VStack {
            Text("Départ")
            if startStation != nil {
                HStack {
                    Text("\(startStation?.name ?? "")")
                    Image(systemName: "trash")
                        .onTapGesture {
                            startStation = nil
                        }
                }
            } else {
                HStack {
                    ForEach(favoriteStartStations) { station in
                        StationItemView(station: station)
                    }
                    AddStationItemView()
                }
            }
            
            if startStation != nil {
                Text("Arrivée")
                if startStation != nil {
                    HStack {
                        Text("\(startStation?.name ?? "")")
                        Image(systemName: "trash")
                            .onTapGesture {
                                startStation = nil
                        }
                    }
                } else {
                    HStack {
                        ForEach(favoriteStartStations) { station in
                            StationItemView(station: station)
                        }
                        AddStationItemView()
                    }
                }
            }
        }
    }
}

struct Rides_Previews: PreviewProvider {
    static var previews: some View {
        RidesView()
    }
}
