//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Ahmet Kaan Kara on 11.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do {
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)

                            } catch {
                                print("Error")
                            }

                        }
                }
            }
            else{
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }

            }
        }
        .background(Color(hue: 0.631, saturation: 0.847, brightness: 0.442))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
