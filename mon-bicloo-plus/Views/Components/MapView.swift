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
    @State var showCallout: Bool = false
    @State var showDisplayModeSwitch: Bool = false
    @State private var displayModeDocks: Bool = false
    
    var showStation: ((StationInformation) -> Void)? = nil

    enum DisplayMode {
        case Bike
        case Docks
    }

    var body: some View {
        ZStack {
            MapViewRepresentable(checkpoints: checkpoints, loadingMapView: $loadingMapView, showCallout: showCallout, displayMode: displayModeDocks ? .Docks : .Bike, showStation: showStation)
                .accentColor(.blue)

            if showDisplayModeSwitch {
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "v.circle")
                                .foregroundColor(displayModeDocks ? .secondary : .primary)
                                .padding(.leading, 10)
                            
                            Toggle(isOn: $displayModeDocks) { EmptyView() }
                                .labelsHidden()
                                .toggleStyle(ColoredToggleStyle())
                            
                            Image(systemName: "p.circle")
                                .foregroundColor(displayModeDocks ? .primary : .secondary)
                                .padding(.trailing, 10)
                        }
                        .padding(.bottom, 5)
                        .background(Color.background)
                        .cornerRadius(15, corners: [.bottomRight])
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(checkpoints: [], loadingMapView: .constant(false), showDisplayModeSwitch: true)
    }
}
