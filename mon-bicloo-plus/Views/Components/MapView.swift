//
//  MapView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 06/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView

    @State var checkpoints: [StationAnnotation]
    @Binding var loadingMapView: Bool

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

        if uiView.annotations.filter({ !$0.isKind(of: MKUserLocation.self) }).count == 0 ||
            checkpoints.count != uiView.annotations.filter({ !$0.isKind(of: MKUserLocation.self) }).count ||
            hasUserLocationAnnotation && uiView.tag == 0 {
            uiView.tag = hasUserLocationAnnotation ? 1 : uiView.tag
            
            // Remove all annotations except user location
            uiView.removeAnnotations(uiView.annotations.filter({ !$0.isKind(of: MKUserLocation.self) }))
            uiView.addAnnotations(checkpoints)
            uiView.showAnnotations(uiView.annotations, animated: true)
            print("Updating map \(uiView.tag) \(hasUserLocationAnnotation)")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, loadingMapView: $loadingMapView)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var mapView: MapView
        var loadingMapView: Binding<Bool>

        init(_ mapView: MapView, loadingMapView: Binding<Bool>) {
            self.mapView = mapView
            self.loadingMapView = loadingMapView
        }

        func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotationView) {
            logger.debug("Did select annotation \(String(describing: annotation.annotation?.title))")
        }

        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            loadingMapView.wrappedValue = false
        }
    }
}
