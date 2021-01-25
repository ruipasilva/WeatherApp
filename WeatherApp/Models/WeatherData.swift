//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import Foundation


struct WeatherData: Decodable {
    var current: Current
    var location: Location
}


struct Current: Decodable, Identifiable {
    var id = UUID()
    var temperature: Int
    var weatherDescriptions: [String]
    var weatherCode: Int
    var isDay: String
    var feelsLike: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case weatherDescriptions = "weather_descriptions"
        case weatherCode = "weather_code"
        case isDay = "is_day"
        case feelsLike = "feelslike"
    }
}

struct Location: Decodable {
    var name: String
    
}


struct MockData {
    static var weather = WeatherData(current: Current(temperature: 0, weatherDescriptions: ["Weather?"], weatherCode: 3456, isDay: "Yes", feelsLike: 0), location: Location(name: "Location"))
}
