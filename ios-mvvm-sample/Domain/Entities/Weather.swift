//
//  Weather.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

struct WeatherGroups {
    let weather: [Weather]
    let main: Main
}

struct Weather {
    let id: Int
    let main: Parameters
    let description: String
    let icon: String
}

enum Parameters: String {
    case Thunderstorm
    case Drizzle
    case Rain
    case Snow
    case Clouds
    case Clear
    case Mist, Smoke, Haze, Dust, Fog, Sand, Ash, Squall, Tornado
    case None
}

struct Main {
    let temp: Int
    let feels_like: Float
    let temp_min: Int
    let temp_max: Int
    let humidity: Int
}
