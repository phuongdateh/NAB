//
//  WeatherCondition.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation

struct WeatherCondition: Decodable {
    
    let pressure: Int
    let humidity: Int
    let weather: [Weather]
    let date: Date
    let temp: Temperature
    
    enum CodingKeys: String, CodingKey {
        case pressure
        case weather
        case date = "dt"
        case temp
        case humidity
    }
}

extension WeatherCondition {
    func toWeatherConditionViewModelItem() -> WeatherConditionViewModelItem {
        return .condition(self)
    }
    
    var dateString: String {
        get {
            let dateforrmater = DateFormatter()
            dateforrmater.timeZone = .current
            dateforrmater.dateFormat = "EE, MMM d yyyy"
            return dateforrmater.string(from: date)
        }
    }
}
