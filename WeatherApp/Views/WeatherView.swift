//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Rui Silva on 25/01/2021.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.data.location.name)
                .font(.system(size: 50))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(.bottom, 2)
            ForEach(viewModel.data.current.weatherDescriptions, id: \.self) { _ in
                Text(viewModel.switchDescription())
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(.bottom)
            Image(systemName: viewModel.switchCode())
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text("\(viewModel.data.current.temperature)º")
                .font(.system(size: 70))
                .bold()
                .foregroundColor(.white)
            HStack {
                Text("Feels like")
                Text("\(viewModel.data.current.feelsLike)º")
            }
            .foregroundColor(.white)
//            HStack {
//                Text("Yesterday")
//                Text("0º")
//                Image(systemName: "cloud.sun.fill")
//                    .renderingMode(.original)
//            }
//            .font(.title3)
//            .foregroundColor(.white)
//            .padding(.top, 40)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherView()
                .preferredColorScheme(.dark)
                
        }
    }
}
