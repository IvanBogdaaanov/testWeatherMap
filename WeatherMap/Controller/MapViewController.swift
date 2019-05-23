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
    
    var dataForTable: Weather?
    
    let Map = MapView()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        Map.sizeMap(VC: self)
        Map.delegate = self
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

extension MapViewController: GMSMapViewDelegate {
    

    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        Map.clear()
        let markerOnMap = GMSMarker()
        markerOnMap.position = coordinate
        markerOnMap.map = Map
        
        getWeather(coordinate: coordinate) { (arrayObject) in
            let newArrayObject = arrayObject as! Weather
            self.dataForTable = newArrayObject
            
            for counter in 0..<20 {
                getMarkArea(position: newArrayObject.list[counter].coord,
                            city: newArrayObject.list[counter].name,
                            mapAdd: self.Map,
                            temp: newArrayObject.list[counter].main.temp,
                            pressure: newArrayObject.list[counter].main.pressure,
                            humidity: newArrayObject.list[counter].main.humidity,
                            windSpeed:newArrayObject.list[counter].wind.speed)
            }
        }
    }
}


