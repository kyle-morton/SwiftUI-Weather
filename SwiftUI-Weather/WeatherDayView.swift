//
//  WeatherDayView.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 7/31/25.
//
import SwiftUI


struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original) // converts it from black to a color icon
                .resizable()
                .aspectRatio(contentMode: .fit ) // forces the image to fit it's aspect ratio into the container (our frame below)
                .frame(width:40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
