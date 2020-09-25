//
//  WeatherDataSource.swift
//  ios-rx-mvvm-sample
//
//  Created by seungminbae on 2020/08/13.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

protocol WeatherDataSource {
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherResults) -> Void)
}

enum CurrentWeatherResults {
    case success(weather: Weather)
    case failure(reason: String)
}
