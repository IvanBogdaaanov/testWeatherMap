//
//  getWeather.swift
//  WeatherMap
//
//  Created by Иван on 23.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation
import GoogleMaps



func getWeather(coordinate: CLLocationCoordinate2D, success: @escaping (Any?) -> ()){
    guard let urlOne = URL(string: "https://api.openweathermap.org/data/2.5/find?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&cnt=20&appid=\(DataFromServer.apiKeyWeather.rawValue)") else {return}
    print(urlOne)
    let request = URLRequest(url: urlOne)
    let session = URLSession.shared
    session.dataTask(with: request) {(data,error,response) in
        
        guard let data = data else {return}
        do {
            
            
            let object = try JSONDecoder().decode(Weather.self, from: data)
            success(object)
            
            
        }catch {
            
            print(error)
            
        }
        }.resume()
}

