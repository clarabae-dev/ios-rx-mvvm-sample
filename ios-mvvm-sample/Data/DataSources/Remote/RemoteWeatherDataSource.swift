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
    
    func fetchCurrentWeather() {
        //TODO 사용자 위치 받아오기
        AF.request(URL.currentWeather(lat: 37.55349721201432, lon: 126.97261276107352))
            .responseJSON { response in
                switch response.result {
                case .failure(let error): print("fetchCurrentWeather error: \(String(describing: error.errorDescription))")
                case .success(let value):
                    let json = JSON(value)
                    debugPrint(json)
                    let weather = WeatherDto(json).toDomain()
                }
        }
        
    }
    
    
}
