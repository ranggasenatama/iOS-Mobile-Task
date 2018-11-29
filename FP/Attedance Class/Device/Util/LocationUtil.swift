//
//  LocationUtils.swift
//  Device
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import CoreLocation

class LocationUtil: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    public var longtitude: Double!
    public var latitude: Double!

    override init() {
        super.init()
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.latitude = locValue.latitude
        self.longtitude = locValue.longitude
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}
