//
//  RemoteWeatherDataSource.swift
//  ios-rx-mvvm-sample
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
                    debugPrint("fetchCurrentWeather error: \(String(describing: error.errorDescription))")
                    guard let code = error.responseCode
                    else {
                        completion(CurrentWeatherResults.failure(reason: "알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요."))
                        return
                    }
                    switch code {
                    case 400..<500:
                        completion(CurrentWeatherResults.failure(reason: "잘못된 요청입니다. 잠시 후 다시 시도해주세요."))
                    default:
                        completion(CurrentWeatherResults.failure(reason: "날씨 정보를 불러올 수 없습니다. 잠시 후 다시 시도해주세요."))
                    }
                case .success(let value):
                    let json = JSON(value)
                    debugPrint(json)
                    completion(CurrentWeatherResults.success(weather: WeatherDto(json).toDomain()))
                }
        }
    }
    
}
