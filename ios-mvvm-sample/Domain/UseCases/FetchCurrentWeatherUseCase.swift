//
//  FetchCurrentWeatherUseCase.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

protocol FetchCurrentWeatherUseCase {
    func execute()
}

final class DefaultFetchCurrentWeatherUseCase: FetchCurrentWeatherUseCase {
    
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func execute() {
        weatherRepository.fetchCurrentWeather()
    }
    
    
}
