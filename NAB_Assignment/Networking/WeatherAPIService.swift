//
//  WeatherAPIService.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class WeatherAPIService: WeatherAPI {
    
    func getForecastDaily(by cityName: String) -> Observable<WeatherResponse> {
        return Observable<WeatherResponse>.create({ observer in
            guard let url = URL(string: Configs.Network.weatherUrl) else {
                fatalError("URL invalid")
            }
            let requestInfo = ForecastDailyRequest(q: cityName)
            let request = URLSession.shared.dataTask(with: requestInfo.request(with: url), completionHandler: { data, response, error in
                if let data = data,
                   let json  = String(data: data, encoding: .utf8),
                   let dictionary = json.toDictionary() {
                    let responseData = WeatherResponse()
                    if let weather = JSONDecoder().map(WeatherForecast.self, from: dictionary) {
                        responseData.weatherForecast = weather
                    } else if let errorData = JSONDecoder().map(ErrorResponse.self, from: dictionary) {
                        responseData.error = errorData
                    }
                    observer.onNext(responseData)
                    return
                }
            })
            request.resume()
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
