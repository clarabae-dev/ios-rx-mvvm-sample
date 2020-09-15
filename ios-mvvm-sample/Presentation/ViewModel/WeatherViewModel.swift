//
//  WeatherViewModel.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/09/02.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    private let fetchCurrentWeatherUseCase: FetchCurrentWeatherUseCase
    
    init() {
        self.fetchCurrentWeatherUseCase = DefaultFetchCurrentWeatherUseCase()
    }
    
    func showCurrentWeather(completion: @escaping (String) -> Void) {
        fetchCurrentWeatherUseCase.execute { result in
            switch result {
            case .failure(let reason):
                completion("오류: \(reason)")
            case .success(let weather):
                completion("\(weather.description)")
            }
        }
    }
}
