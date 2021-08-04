//
//  ForecastDailyRequest.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

enum TemparetureUnits: String {
    case kelvin
    case metric // Celsius
    case imperial // Fahrenheit
}

class ForecastDailyRequest: APIRequest {
    var headers: [String : String]
    var metthod: RequestType = .GET
    var parameters: [String : Any]
    var path: String = "forecast/daily"
    
    // Default for request
    private let units: String = TemparetureUnits.metric.rawValue
    private let cnt: Int = 7 // A number of days
    
    init(q cityName: String) {
        parameters = [
            "q": cityName,
            "appid": Configs.Network.appId,
            "units": self.units,
            "cnt": cnt
        ]
        headers = [:]
    }
}
