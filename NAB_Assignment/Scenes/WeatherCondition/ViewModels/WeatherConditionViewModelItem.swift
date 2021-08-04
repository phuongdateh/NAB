//
//  WeatherConditionViewModelItem.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import Foundation

class WeatherConditionViewModelItem {
    var condition: WeatherCondition?
    var error: ErrorResponse?
}

extension WeatherConditionViewModelItem {
    var content: String {
        get {
            if let condition = condition {
                var contentStr: String = ""
                contentStr += "Date: \(condition.dateString)"
                contentStr += "\nAverage Temperature: \(condition.temp.average)°C"
                contentStr += "\nPressure: \(condition.pressure)"
                contentStr += "\nHumidity: \(condition.humidity)%"
                if condition.weather.isEmpty == false {
                    contentStr += "\nDescription: \(condition.weather[0].description)"
                }
                return contentStr
            }
            return ""
        }
    }
}
