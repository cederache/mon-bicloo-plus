//
//  MapView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 02/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct MapView: View {
    var checkpoints: [StationAnnotation]
    @Binding var loadingMapView: Bool
    var displayMode: DisplayMode = .Bike
    @State var showDisplayModeSwitch: Bool = false
    
    enum DisplayMode {
        case Bike
        case Docks
    }
    
    var body: some View {
        ZStack {
            MapViewRepresentable(checkpoints: checkpoints, loadingMapView: $loadingMapView, displayMode: displayMode)
            
            if (showDisplayModeSwitch) {
                HStack {
                    Image(systemName: "v.circle")
                    Toggle(isOn: $showDisplayModeSwitch) { Text("") }
                    Image(systemName: "p.circle")
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(checkpoints: [], loadingMapView: .constant(false))
    }
}
