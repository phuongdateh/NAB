//
//  WeatherResponse.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import Foundation

class WeatherResponse {
    var weatherForecast: WeatherForecast?
    var error: ErrorResponse?
    
    func toWeatherConditionViewModelItem() -> WeatherConditionViewModelItem {
        let item = WeatherConditionViewModelItem()
        item.error = self.error
        return item
    }
}
