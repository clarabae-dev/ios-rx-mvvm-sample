//
//  RemoteWeatherDataSource.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/13.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RemoteWeatherDataSource: WeatherDataSource {
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherResults) -> Void) {
        //TODO 사용자 위치 받아오기
        AF.request(URL.currentWeather(lat: 37.55320889269831, lon: 126.97261286658032))
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    let reason = "code: \(String(describing: error.responseCode))\ndescription: \(String(describing: error.errorDescription))"
                    debugPrint("fetchCurrentWeather error: \(reason)")
                    completion(CurrentWeatherResults.failure(reason: reason))
                case .success(let value):
                    let json = JSON(value)
                    debugPrint(json)
                    completion(CurrentWeatherResults.success(weather: WeatherDto(json).toDomain()))
                }
        }
    }
    
}
