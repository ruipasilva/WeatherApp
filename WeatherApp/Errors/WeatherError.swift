//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import Foundation
import SwiftUI


enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
