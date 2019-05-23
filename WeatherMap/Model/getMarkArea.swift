//
//  getMarkArea.swift
//  WeatherMap
//
//  Created by Иван on 23.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation
import GoogleMaps

func getMarkArea(position: Coord, city: String, mapAdd: GMSMapView,temp:Double,pressure:Double,humidity:Int,windSpeed:Double){
    
    let position = CLLocationCoordinate2D(latitude: position.lat, longitude: position.lon)
    let newtemp = temp - 273.15
    let newwindSpeed = windSpeed * 3.6
    DispatchQueue.main.sync {
        let marker = GMSMarker(position: position)
        let image = UIImage(named: "marker")?.withRenderingMode(.alwaysOriginal)
        let markImageView = UIImageView(image: image)
        marker.iconView = markImageView
        marker.title = city
        marker.map = mapAdd
        marker.snippet = """
        Температура: \(Int(newtemp)) градусов
        Давление: \(pressure)
        Влажность: \(humidity)%
        Скорость ветра: \(Int(newwindSpeed)) км/ч
        """
    }
    
    
}
