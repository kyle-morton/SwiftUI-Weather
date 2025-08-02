//
//  WeatherDay.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 8/2/25.
//

import Foundation

struct ForecastDayModel : Identifiable {
    var id: UUID = UUID()
    public var dayOfTheWeek: String
    public var imageName: String
    public var temperature: Int
}
