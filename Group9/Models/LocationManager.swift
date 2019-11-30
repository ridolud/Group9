//
//  LocationManager.swift
//  Group9
//
//  Created by Willa on 23/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate{
    
    static let instance = LocationManager()
    
    var manager = CLLocationManager()
    var currentLocation: CLLocation?
    var currentCity : String?
    var destinationCity : String?
    var navItem : UINavigationItem?
    var viewController : UIViewController?
    
    var locationDelegate: LocationManagerDelegate?
    
    func allowAccess(){
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    }
    
    func checkCurrentLocation(){
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            currentLocation = location
            changeCityName(location)
            self.locationDelegate?.reloadView?()
            manager.stopUpdatingLocation()
        }
    }
    
    func calculateDistance(location : CLLocation) -> CLLocationDistance{
        return (currentLocation?.distance(from: location))!
    }
    
    func changeCityName(_ location: CLLocation){
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { (arrayOfPlacemark, error) in
            guard let placemark = arrayOfPlacemark?.first else{ return }
            self.currentCity = placemark.locality
            self.locationDelegate?.reloadView?()
        }
    }
}

@objc protocol LocationManagerDelegate {
    @objc optional func reloadView()
}


//Tutorial cara pakai =

//1. Tanya teman
