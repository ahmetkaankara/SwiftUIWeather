//
//  WelcomeView.swift
//  SwiftUIWeather
//
//  Created by Ahmet Kaan Kara on 11.05.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing:10){
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                    
                
                Text("Please share your current location to get the weather in your area")
                    .font(.caption)
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
