//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import Foundation


class WeatherViewModel: ObservableObject{
    
    @Published var data = MockData.weather
    
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    func getWeather() {
        isLoading = true
        NetworkManager.shared.getWeather { [self] (result) in // Used [self] so I don't have to type self everytime below
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let weather):
                    data = weather
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    func switchCode() -> String {
        switch data.current.weatherCode {
        case 113:
            if data.current.isDay == "yes" {
                return "sun.max.fill" } else {
                return "moon.stars.fill"
            }
        case 116:
            if data.current.isDay == "yes" {
                return "cloud.sun.fill" } else {
                return "cloud.moon"
            }
        case 119:
            return "cloud.fill"
        case 122:
            return "smoke.fill"
        case 143:
            return "cloud.fog.fill"
        case 176:
            return "cloud.drizzle.fill"
        case 179:
            return "cloud.hail.fill"
        case 182:
            return "cloud.sleet.fill"
        case 185:
            return "cloud.hail.fill"
        case 200:
            return "cloud.bolt.rain.fill"
        case 227:
            return "cloud.snow.fill"
        case 230:
            return "wind.snow"
        case 248:
            return "cloud.fog.fill"
        case 260:
            return "cloud.fog"
        case 263:
            return "cloud.drizzle.fill"
        case 266:
            return "cloud.drizzle.fill"
        case 281:
            return "cloud.drizzle.fill"
        case 284:
            return "cloud.drizzle.fill"
        case 293:
            return "cloud.rain.fill"
        case 296:
            return "cloud.rain.fill"
        case 299:
            return "cloud.rain.fill"
        case 302:
            return "cloud.heavyrain.fill"
        case 305:
            return "cloud.heavyrain.fill"
        case 308:
            return "cloud.heavyrain.fill"
        case 311:
            return "cloud.hail.fill"
        default:
            return  "sun.max.fill"
        }
    }
    
    func switchDescription() -> String {
        switch data.current.weatherCode {
        case 113:
            if data.current.isDay == "yes" {
                return "Sun is up! You should go out." } else {
                return "Clear Sky! \nCan you spot the Stars?"
            }
        case 116:
            return  "A cloud here and there, It's ok!"
        case 119:
            return "Do you enjoy clouds? Today is for you!"
        case 122:
            return "Where did the sun go today?"
        case 143:
            return "A bit spooky today! Mist ahead!"
        case 176:
            return "Wouldn't hurt to take an umbrella with you today."
        case 179:
            return "Brrrr - Might get some snow"
        case 182:
            return "Snow that won't settle"
        case 185:
            return "Veeeery slippery today. watch out"
        case 200:
            return "Might find a Pikachu around today"
        case 227:
            return "Snowboard? Skiing? It's your day today"
        case 230:
            return "Watch out today! A blizzard you might find"
        case 248:
            return "Can't see a thing? It's probably fog"
        case 260:
            return "Is it me or this fog is freezing?"
        case 263:
            return "Rain that doesn't get you wet"
        case 266:
            return "Rain that doesn't get you wet"
        case 281:
            return "Cold Drizzle today"
        case 284:
            return "Heavy freezing drizzle"
        case 293:
            return "Might find some rain, Take an umbrella"
        case 296:
            return "Have you got a rain coat? \nTime to show it off"
        case 299:
            return "Have you got a rain coat? Time to show it off"
        case 302:
            return "A fair amount of rain"
        case 305:
            return "Some serious rain on your way today! \nSometimes"
        case 308:
            return "Some serious rain on your way today!"
        case 311:
            return "Not a lot a rain, but it's cold."
        default:
            return  "sun.max.fill"
        }
    }
}
