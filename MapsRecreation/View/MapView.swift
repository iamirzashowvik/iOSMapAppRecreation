//
//  MapView.swift
//  MapsRecreation
//
//  Created by Mirza Showvik on 31/10/23.
//
import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var locationViewModel = LocationViewModel()

    var body: some View {
        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: locationViewModel.userLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        ))
        .onAppear {
            locationViewModel.startUpdatingLocation()
        }
    }
}
