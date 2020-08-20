//
//  FetchCurrentWeatherUseCase.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

protocol FetchCurrentWeatherUseCase {
    func execute()// 특별한 유저 요청값은 필요없다. 유저의 위치 데이터가 필요하지만, 유저가 직접 입력할 필요없음. 결과값만 리턴하면 됨.
}

final class DefaultFetchCurrentWeatherUseCase: FetchCurrentWeatherUseCase {
    
    private let weatherRepository: WeatherRepository
    
    init?(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func execute() {
        weatherRepository.fetchCurrentWeather { currentWeatherResults in
            switch currentWeatherResults {
            case .failure(let reason):
                //todo 오류 이유 띄워주기
                print("")
            case .success(let weather):
                //todo 날씨 정보 보여주기
                print("")
            }
        }
    }
    
    
}
