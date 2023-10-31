//
//  ContentView.swift
//  MapsRecreation
//
//  Created by Mirza Showvik on 31/10/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationViewModel = LocationViewModel()

    var body: some View {
      ZStack {
            if locationViewModel.location != nil {
                Map(coordinateRegion: .constant(
                           MKCoordinateRegion(
                            center: locationViewModel.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),
                               span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                           )
                )).ignoresSafeArea()
            } else {
//                Text("Waiting for location...")
                Map(coordinateRegion: .constant(
                           MKCoordinateRegion(
                            center: locationViewModel.location?.coordinate ?? CLLocationCoordinate2D(latitude: 23.719898, longitude: 90.389574),
                               span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                           )
                )).ignoresSafeArea()
            }
          VStack {
              Spacer()
              Button {
                  locationViewModel.startUpdatingLocation()
              } label: {
                  Image(systemName: "map")
                      .foregroundColor(Color.black)
                      .frame(width: 30,height: 30)
                      .padding(4)
                      .background(Color.white)
                      .cornerRadius(30)
                      .padding()
                      .frame(maxWidth: .infinity,alignment: .trailing)
                     
          }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
