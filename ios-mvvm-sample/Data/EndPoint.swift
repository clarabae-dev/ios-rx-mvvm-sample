//
//  EndPoint.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/12.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation

extension URL {
    static func currentWeather(lat: Double, lon: Double) -> URL {// 다른 파일에서 접근가능하도록 static 붙임.
        makeForEndpoint("&lat=\(lat)&lon=\(lon)")
    }
}

private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=&lang=kr&units=metric\(endpoint)")!
    }
}
