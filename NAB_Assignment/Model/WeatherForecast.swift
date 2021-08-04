//
//  WeatherForecast.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

struct WeatherForecast: Decodable {
    let city: CityInfo
    let cod: String
    let message: Double
    let cnt: Int
    let weatherConditions: [WeatherCondition]
}

extension WeatherForecast {
    enum CodingKeys: String, CodingKey {
        case city
        case cod
        case message
        case cnt
        case weatherConditions = "list"
    }
}
