//
//  LocationManager.swift
//  UpSticks-ios
//
//  Created by Rohit Saini on 17/04/20.
//  Copyright © 2020 Sukhmani. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

open class SainiLocationManager: NSObject {
    
    //MARK:- variable
    public static var shared:SainiLocationManager = {
       return SainiLocationManager()
    }()
    
    public var clManager: CLLocationManager!
    public var currentLocation:BoxBind<AppLocation?> = BoxBind(nil)
    public var currentCity:BoxBind<String?> = BoxBind(nil)
    public var currentCountry:BoxBind<String?> = BoxBind(nil)
    public var currentCountryCode:BoxBind<String?> = BoxBind(nil)
    
    //MARK:- initializers
    public override init() {
        super.init()
        clManager = CLLocationManager()
        clManager.delegate = self
    }
    
    //MARK:- functions
    public func requestPermissionIfRequired(){
        clManager.desiredAccuracy = kCLLocationAccuracyBest
        clManager.requestWhenInUseAuthorization()
    }
}


//MARK:- Core Location Delegate
extension SainiLocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager,
                                didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined,.restricted,.denied:
            log.error("Location access blocked")/
        case .authorizedWhenInUse,.authorizedAlways:
            log.error("Location permission granted")/
            getLocationForUser(location: manager.location)
        @unknown default:
            break
        }
    }
    
    private func getLocationForUser(location:CLLocation?){
        guard let location = location else {return}
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location,preferredLocale: .current){ [self] (placemarks, error) in
            if error == nil{
                guard let placemarks = placemarks else {return}
                let placemark = placemarks[0]
                let appLocation = AppLocation(latitude: placemark.location?.coordinate.latitude ?? 0, longitude: placemark.location?.coordinate.longitude ?? 0)
                currentLocation.value = appLocation
                currentCity.value = placemark.locality
                currentCountry.value = placemark.country
                currentCountryCode.value = placemark.isoCountryCode
            }
            else{
                log.error("Error while decoding current location")/
            }
        }
        
    }
}

//Listener
open class BoxBind<T>{
    public typealias Listener = (T) -> ()
    
    //MARK:- variable
    public var value: T{
        didSet{
            listener?(value)
        }
    }
    
    public var listener:Listener?
    
    //MARK:- initializers
    init(_ value:T){
        self.value = value
    }
    
    //MARK:- functions
    public func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}

//MARK:- AppLocation
public struct AppLocation {
    var latitude:CLLocationDegrees
    var longitude:CLLocationDegrees
}
