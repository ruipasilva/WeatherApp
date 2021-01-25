//
//  Alerts.swift
//  WeatherApp
//
//  Created by Rui Silva on 25/01/2021.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("Something went wrong! Please contact support or try again later."), dismissButton: .default(Text("Ok!")))
    
    static let invalidResponse = AlertItem(title: Text("No Internet Connection"), message: Text("Oops, please check your internet connection and try again"), dismissButton: .default(Text("Ok!")))
    
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("Something went wrong with the weather serves. Please try again later"), dismissButton: .default(Text("Ok!")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Oops, please check your internet connection and try again"), dismissButton: .default(Text("Ok!")))
    
    
}
//case invalidURL
//case invalidResponse
//case invalidData
//case unableToComplete
