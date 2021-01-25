//
//  SunsetSunriseData.swift
//  WeatherApp
//
//  Created by Rui Silva on 25/01/2021.
//

import Foundation


struct SunsetSunriseData: Decodable {
    
}


struct Results: Decodable {
    var sunrise = Date()
    var sunset = Date()
}
