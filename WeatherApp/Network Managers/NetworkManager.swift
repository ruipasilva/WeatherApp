//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import Foundation
import SwiftUI


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "http://api.weatherstack.com/current?access_key=c9e4a4b34197624cf6a79d9231edce2e&query="
    
    static let locationString = "London"
    
    private let weatherURL = baseURL + locationString
 
    private init() {}
    
    
    func getWeather(completed: @escaping(Result<WeatherData, WeatherError>) -> Void) {
        
        guard let url = URL(string: weatherURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(WeatherData.self, from: data)
                completed(.success(decodedResponse.self))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
