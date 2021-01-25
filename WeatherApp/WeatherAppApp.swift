//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel.init())
        }
    }
}
