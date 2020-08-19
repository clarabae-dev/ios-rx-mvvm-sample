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
        self.id = json["id"].intValue
        self.main = json["main"].stringValue
        self.description = json["description"].stringValue
        self.icon = json["icon"].stringValue
    }
    
    func toDomain() -> Weather {
        return .init(id: id,
                     main: Parameters(rawValue: main) ?? Parameters.None,
                     description: description,
                     icon: icon)
    }
}
