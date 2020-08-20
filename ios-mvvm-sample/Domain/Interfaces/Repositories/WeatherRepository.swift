//
//  WeatherRepository.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/13.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

protocol WeatherRepository {
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherResults) -> Void)
}
