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
    let date: Int
    let temp: Temperature
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        pressure = (try? container.decode(Int.self, forKey: .pressure)) ?? 0
        weather = (try? container.decode([Weather].self, forKey: .weather)) ?? []
        date = (try? container.decode(Int.self, forKey: .date)) ?? Int(Date().timeIntervalSince1970)
        temp = (try? container.decode(Temperature.self, forKey: .temp)) ?? Temperature.default
        humidity = (try? container.decode(Int.self, forKey: .humidity)) ?? 0
    }

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
        let item = WeatherConditionViewModelItem()
        item.condition = self
        return item
    }
    
    var dateString: String {
        get {
            let newDate = Date(timeIntervalSince1970: TimeInterval(self.date))
            let dateforrmater = DateFormatter()
            dateforrmater.timeZone = .current
            dateforrmater.dateFormat = "EE, MMM d yyyy"
            return dateforrmater.string(from: newDate)
        }
    }
}
