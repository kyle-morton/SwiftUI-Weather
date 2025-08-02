//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 7/30/25.
//

/*
 
 CHALLENGES
 1) Create a data model of the weather day (dayOfTheWeek, imageName, temp)
 2) Find a basic weather API and pull the weather data dynamically
 3) Tab view different cities? 
 */



import SwiftUI

struct ContentView: View {
    
    // Structs don't hold state (views get created and destroyed all the time)
    // @State let's swift know to keep track of this value even if the view itself is recycled
    @State private var isNight:Bool = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(
                isNight: $isNight
            )
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    isNight: $isNight,
                    temperature: 78
                )
                    
                HStack(spacing:20) {
                    WeatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 78)
                    WeatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 81)
                    WeatherDayView(dayOfTheWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 75)
                    WeatherDayView(dayOfTheWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 79)
                    WeatherDayView(dayOfTheWeek: "SAT", imageName: "sun.max.fill", temperature: 83)
                }
                
                Spacer()
//            
//                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
//                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .foregroundColor(Color.blue)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

// If it's unique to the current view, leave the structs in this same file
// if something global, put in it's own file

struct BackgroundView: View {
    
    @Binding var isNight: Bool

    var body: some View {
        
        // You can add as many colors to the array (it's really cool)
        LinearGradient(
            colors: [isNight
                     ? Color.black : Color.blue,
                     isNight
                     ? Color.gray : Color("LightBlue")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


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
    @Binding var isNight: Bool
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
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

