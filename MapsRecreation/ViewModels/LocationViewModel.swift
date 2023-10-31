//
//  LocationViewModel.swift
//  MapsRecreation
//
//  Created by Mirza Showvik on 31/10/23.
//

import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var location: CLLocation?

    override init() {
        super.init()
        print("init called")
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    
    func startUpdatingLocation() {
         self.locationManager.startUpdatingLocation()
         print(self.locationManager.location?.coordinate)
     }
     
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let newLocation = locations.last {
             self.location = newLocation
         }
     }
     
     
     func stopUpdatingLocation() {
         self.locationManager.stopUpdatingLocation()
     }
}
