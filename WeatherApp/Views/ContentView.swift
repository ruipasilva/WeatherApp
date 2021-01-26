//
//  ContentView.swift
//  WeatherApp
//
//  Created by Rui Silva on 22/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: WeatherViewModel
    
    
    
    var body: some View {
            ZStack {
                if viewModel.data.current.isDay == "no"{
                    LinearGradient(gradient: Gradient(colors: [.nightClearSkyTop, .nightClearSkyBottom]), startPoint: .top, endPoint: .bottom)
                } else {
                    LinearGradient(gradient: Gradient(colors: [.dayClearSkyTop, .dayClearSkyBottom]), startPoint: .top, endPoint: .bottom)
                }
                WeatherView(viewModel: viewModel)
                            .onAppear() {
                    viewModel.getWeather()
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .ignoresSafeArea(.all)
            .alert(item: $viewModel.alertItem) { (alertItem) -> Alert in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}
