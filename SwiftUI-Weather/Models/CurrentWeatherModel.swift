//
//  WeatherCity.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 8/2/25.
//

import Foundation

struct CurrentWeatherModel
{
    var cityName: String
    var temperature: Int
    var forecastDays: [ForecastDayModel]
}
