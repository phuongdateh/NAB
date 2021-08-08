//
//  WeatherResponse.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import Foundation

enum WeatherResponse {
    case weatherForecast(WeatherForecast)
    case error(ErrorResponse)
    
    func toWeatherConditionViewModelItem() -> [WeatherConditionViewModelItem] {
        switch self {
        case .weatherForecast(let weatherForecast):
            return weatherForecast.weatherConditions.map({ $0.toWeatherConditionViewModelItem()})
        case .error(let error):
            return [error.toWeatherConditionViewModelItem()]
        }
    }
}
