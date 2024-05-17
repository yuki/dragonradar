//
//  LocationManager.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 17/5/24.
//

import Foundation
import CoreLocation
import _MapKit_SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        DispatchQueue.main.async {
            self.location = latestLocation
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async {
            if status == .authorizedWhenInUse {
                self.startUpdatingLocation()
            } else {
                //FIXME: funciona esto?
                self.startUpdatingLocation()
            }
        }
    }
}
