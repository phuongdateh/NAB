//
//  ErrorResponse.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let cod: String
    let message: String
}

extension ErrorResponse {
    func toWeatherConditionViewModelItem() -> WeatherConditionViewModelItem {
        return .error(self)
    }
}

extension ErrorResponse {
    static func noInternet(code: Int, message: String) -> ErrorResponse {
        return .init(cod: "\(code)", message: message)
    }
    
    static var somethingwrong: ErrorResponse {
        return .init(cod: "\(500)", message: "Some things wrong!")
    }
}
