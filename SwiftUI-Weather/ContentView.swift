//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 7/30/25.
//

/*
 
 CHALLENGES
 1) Create a data model of the weather day (dayOfTheWeek, imageName, temp) - DONE
 2) Find a basic weather API and pull the weather data dynamically
 3) Tab view different cities?
 */



import SwiftUI

struct ContentView: View {
    
    // Structs don't hold state (views get created and destroyed all the time) - @State let's swift know to keep track of this value even if the view itself is recycled
    @State private var isNight:Bool = false
    private var currentWeather: CurrentWeatherModel = CurrentWeatherModel(cityName: "Cupertino, CA", temperature: 78, forecastDays: [
        ForecastDayModel(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 78),
        ForecastDayModel(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 81),
        ForecastDayModel(dayOfTheWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 75),
        ForecastDayModel(dayOfTheWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 79),
        ForecastDayModel(dayOfTheWeek: "SAT", imageName: "sun.max.fill", temperature: 83)
    ])
    
    var body: some View {
        ZStack {
            
            BackgroundView(
                isNight: isNight
            )
            
            VStack {
                CityTextView(cityName: currentWeather.cityName)
                
                MainWeatherStatusView(
                    isNight: $isNight,
                    temperature: currentWeather.temperature
                )
                    
                HStack(spacing:20) {
                    ForEach(currentWeather.forecastDays, id: \.dayOfTheWeek) { day in
                        WeatherDayView(day: day)
                    }
                }
                
                Spacer()
            
                WeatherButton(
                    title: "Change Day Time",
                    textColor: .blue,
                    backgroundColor: .white,
                    value: $isNight
                )

                Spacer()
            }
        }
        .onAppear{
//            let testButton = WeatherButton(title: isNight ? "Button - On" : "Button - Off", textColor: Color.white, backgroundColor: Color.blue, value: $isNight)
//            print(type(of: testButton.body))
            
            // This is what our weatherButton looks like in the debugger
            // Notice the Modified Content wrappers - these are what SwiftUI does with our modifiers. Each subsequent modifier wraps the things before it
//            Button
//            <ModifiedContent
//            <ModifiedContent
//            <ModifiedContent
//            <ModifiedContent
//            <ModifiedContent<Text, _FrameLayout>, _BackgroundStyleModifier<AnyGradient>>, _EnvironmentKeyWritingModifier<Optional<Color>>>, _EnvironmentKeyWritingModifier<Optional<Font>>>, _ClipEffect<RoundedRectangle>>>
        }
    }
}

// If it's unique to the current view, leave the structs in this same file
// if something global, put in it's own file

struct BackgroundView: View {
    
//    @Binding var isNight: Bool - don't actuall need @Binding b/c it's one-way binding (only need if you want 2-way)
    var isNight: Bool

    var body: some View {
        
//        // You can add as many colors to the array (it's really cool) - for stuff that needs a little more custimazation (iOS 16 introduced color.x.gridiant)
//        LinearGradient(
//            colors: [isNight
//                     ? Color.black : Color.blue,
//                     isNight
//                     ? Color.gray : Color("LightBlue")],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
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
                .symbolRenderingMode(.multicolor)
                // .renderingMode(.original) // converts it from black to a color icon (iOS 14 and below)
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

struct WeatherDayView: View {
    
    var day: ForecastDayModel
    
    var body: some View {
        VStack {
            Text(day.dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: day.imageName)
                .symbolRenderingMode(.multicolor)
//                .renderingMode(.original) // converts it from black to a color icon (iOS 14 and below)
                .resizable()
//                .foregroundColor(.yellow)
//                .foregroundStyle(.pink, .orange, .blue)
                .aspectRatio(contentMode: .fit ) // forces the image to fit it's aspect ratio into the container (our frame below)
                .frame(width:40, height: 40)
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


#Preview {
    ContentView()
}

