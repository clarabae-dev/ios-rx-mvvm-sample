//
//  EndPoint.swift
//  ios-rx-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

extension URL {
    static func currentWeather(lat: Double, lon: Double) -> URL {
        makeForEndpoint("&lat=\(lat)&lon=\(lon)")
    }
    
    static func loadWeatherIcon(icon: String) -> URL {
        makeLoadIconURL(icon: icon)
    }
}

private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=&lang=kr&units=metric\(endpoint)")!
    }
    
    static func makeLoadIconURL(icon: String) -> URL {
        URL(string: "http://openweathermap.org/img/wn/\(icon).png")!
    }
}
