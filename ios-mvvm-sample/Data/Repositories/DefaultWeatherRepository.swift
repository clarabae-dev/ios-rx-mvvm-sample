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
    
    init(localDataSource: LocalWeatherDataSource, remoteDataSource: RemoteWeatherDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchCurrentWeather() {
        
    }
    
    
}
