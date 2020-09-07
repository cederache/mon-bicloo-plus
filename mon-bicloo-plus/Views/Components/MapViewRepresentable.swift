//
//  MapViewRepresentable.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 06/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import MapKit
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
    typealias UIViewType = MKMapView

    var checkpoints: [StationAnnotation]
    @Binding var loadingMapView: Bool
    var showCallout: Bool = false
    var displayMode: MapView.DisplayMode = .Bike
    
    var showStation: ((StationInformation) -> Void)? = nil

    var locationManager = CLLocationManager()
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    func makeUIView(context: Context) -> MKMapView {
        setupManager()

        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.delegate = context.coordinator
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let hasUserLocationAnnotation = uiView.annotations.filter({ $0.isKind(of: MKUserLocation.self) }).count > 0
        
        if !hasUserLocationAnnotation ||
            checkpoints.count != uiView.annotations.filter({ !$0.isKind(of: MKUserLocation.self) }).count ||
            (hasUserLocationAnnotation && uiView.tag == 0) ||
            context.coordinator.displayMode != displayMode {
            uiView.tag = hasUserLocationAnnotation ? 1 : uiView.tag
            
            let changeDisplayMode = context.coordinator.displayMode != displayMode
            context.coordinator.displayMode = displayMode
            
            // Remove all annotations except user location
            uiView.removeAnnotations(uiView.annotations.filter({ !$0.isKind(of: MKUserLocation.self) }))
            uiView.addAnnotations(checkpoints)
            
            // Zoom on annotations
            if !changeDisplayMode {
                uiView.showAnnotations(uiView.annotations, animated: true)
            }
            print("Updating map \(uiView.tag) \(hasUserLocationAnnotation)")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, loadingMapView: $loadingMapView, showCallout: showCallout, displayMode: displayMode)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var mapView: MapViewRepresentable
        var loadingMapView: Binding<Bool>
        var showCallout: Bool
        var displayMode: MapView.DisplayMode

        init(_ mapView: MapViewRepresentable, loadingMapView: Binding<Bool>, showCallout: Bool, displayMode: MapView.DisplayMode) {
            self.mapView = mapView
            self.loadingMapView = loadingMapView
            self.showCallout = showCallout
            self.displayMode = displayMode
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let stationAnnotation = annotation as? StationAnnotation {
                let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: stationAnnotation.stationInformation.status == nil ? "bolt.circle.fill" : "location.circle.fill")
                annotationView.tag = self.mapView.checkpoints.firstIndex(where: { (sa: StationAnnotation) -> Bool in
                    sa.stationInformation.id == stationAnnotation.stationInformation.id
                }) ?? -1
                if annotationView.tag == -1 {
                    logger.error("Can't retrieve stationAnnotation \(stationAnnotation) from checkpoints \(self.mapView.checkpoints)")
                }
                annotationView.canShowCallout = showCallout
                annotationView.markerTintColor = stationAnnotation.stationInformation.status == nil ? UIColor.yellow : (self.displayMode == .Bike ? stationAnnotation.stationInformation.status!.nbBikesAvailableUIColor : stationAnnotation.stationInformation.status!.nbDocksAvailableUIColor)
                annotationView.detailCalloutAccessoryView = MapCalloutView(rootView: StationStatusView(stationInformation: stationAnnotation.stationInformation, withUnavailableDocks: true, withSpacers: true).eraseToAnyView())
                annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                return annotationView
            }

            return nil
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let stationAnnotation = view.tag == -1 ? nil : self.mapView.checkpoints[view.tag] {
                self.mapView.showStation?(stationAnnotation.stationInformation)
            } else {
                logger.debug("Can't retrieve stationAnnotation for annotationView \(view)")
            }
        }

        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            loadingMapView.wrappedValue = false
        }
    }
}
