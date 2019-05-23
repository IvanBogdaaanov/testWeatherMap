//
//  MapViewController.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    let Map = MapView()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        Map.sizeMap(VC: self)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        

    }
}
extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {

            locationManager.startUpdatingLocation()
            Map.isMyLocationEnabled = true
            Map.settings.myLocationButton = true

        } else if status == .denied {
            
            let locationCoordinates = CLLocationCoordinate2D(latitude: 47.222531, longitude: 39.718705)
            Map.camera = GMSCameraPosition(target:locationCoordinates , zoom: 10, bearing: 0, viewingAngle: 0)

        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locations = locations.first {

            Map.camera = GMSCameraPosition(target: locations.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

        }
    }

}
