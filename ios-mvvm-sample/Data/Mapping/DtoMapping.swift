//
//  DtoMapping.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/08/19.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherDto {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(_ json: JSON) {
        let weatherArray = json["weather"].arrayValue
        self.id = weatherArray[0]["id"].intValue
        self.main = weatherArray[0]["main"].stringValue
        self.description = weatherArray[0]["description"].stringValue
        self.icon = weatherArray[0]["icon"].stringValue
    }
    
    func toDomain() -> Weather {
        return Weather(id: id,
                     main: Parameters(rawValue: main) ?? Parameters.None,
                     description: description,
                     icon: icon)
    }
}
