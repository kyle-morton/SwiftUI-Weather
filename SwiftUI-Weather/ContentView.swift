//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            BackgroundView(
                topColor: Color.blue,
                bottomColor: Color("LightBlue")
            )
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 78)
                    
                HStack(spacing:20) {
                    WeatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 78)
                    WeatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 81)
                    WeatherDayView(dayOfTheWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 75)
                    WeatherDayView(dayOfTheWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 79)
                    WeatherDayView(dayOfTheWeek: "SAT", imageName: "sun.max.fill", temperature: 83)
                }
                
                Spacer()
            
                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                
                Spacer()
            }
        }
    }
}

// If it's unique to the current view, leave the structs in this same file
// if something global, put in it's own file


struct CityTextView: View {
    var cityName: String
    var body : some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white) // order of modifiers matters! Each modifier wraps the previous in a View
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original) // converts it from black to a color icon
                .resizable()
                .aspectRatio(contentMode: .fit ) // forces the image to fit it's aspect ratio into the container (our frame below)
                .frame(width:180, height: 180) // frame is the box we're putting our image into
            
            Text("\(temperature)°")
                .font(.system(size: 76, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



#Preview {
    ContentView()
}

