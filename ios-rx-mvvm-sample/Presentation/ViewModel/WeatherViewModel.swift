//
//  WeatherViewModel.swift
//  ios-rx-mvvm-sample
//
//  Created by seungminbae on 2020/09/02.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation
import RxSwift

class WeatherViewModel {
    
    private let fetchCurrentWeatherUseCase: FetchCurrentWeatherUseCase
    var currentWeather = BehaviorSubject<String>(value: "")
    var weatherIcon = BehaviorSubject<String>(value: "")
    
    init() {
        self.fetchCurrentWeatherUseCase = DefaultFetchCurrentWeatherUseCase()
    }
    
    func showCurrentWeather() {
        fetchCurrentWeatherUseCase.execute { result in
            switch result {
            case .failure(let reason):
                self.currentWeather.onNext("날씨를 불러올 수 없습니다. \(reason)")
            case .success(let weather):
                self.currentWeather.onNext("\(weather.description)")
                self.weatherIcon.onNext("\(weather.icon)")
                debugPrint("아이콘 \(weather.icon)")
            }
        }
    }
}
