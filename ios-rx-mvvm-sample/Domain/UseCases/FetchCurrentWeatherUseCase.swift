//
//  FetchCurrentWeatherUseCase.swift
//  ios-rx-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

protocol FetchCurrentWeatherUseCase {
    func execute(completion: @escaping (CurrentWeatherResults) -> Void)
    // 특별한 유저 요청값은 필요없다. 유저의 위치 데이터가 필요하지만, 유저가 직접 입력할 필요없음. 결과값만 리턴하면 됨.
}

final class DefaultFetchCurrentWeatherUseCase: FetchCurrentWeatherUseCase {
    
    private let weatherRepository: WeatherRepository
    
    init() {
        self.weatherRepository = DefaultWeatherRepository()
    }
    
    func execute(completion: @escaping (CurrentWeatherResults) -> Void) {
        weatherRepository.fetchCurrentWeather { currentWeatherResults in completion(currentWeatherResults) }
    }
    
    
}
