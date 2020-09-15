//
//  DefaultWeatherRepository.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/13.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

final class DefaultWeatherRepository: WeatherRepository {
    
    private let localDataSource: LocalWeatherDataSource
    private let remoteDataSource: RemoteWeatherDataSource
    
    init() {
        self.localDataSource = LocalWeatherDataSource()
        self.remoteDataSource = RemoteWeatherDataSource()
    }
    
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherResults) -> Void) {
        self.remoteDataSource.fetchCurrentWeather(completion: completion)
    }
    
}
