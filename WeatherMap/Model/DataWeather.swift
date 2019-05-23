//
//  DataWeather.swift
//  WeatherMap
//
//  Created by Иван on 23.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let list:[List]
}

struct List:Codable {
    let name: String
    let coord: Coord
    let main: Main
    let wind: Wind
}

struct Wind:Codable {
    let speed:Double
}

struct Coord: Codable {
    let lat, lon: Double
}

struct Main: Codable {
    let temp: Double
    let pressure:Double
    let humidity: Int
}

