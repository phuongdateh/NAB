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
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    if let weather = decoder.map(WeatherForecast.self, from: dictionary) {
                        observer.onNext(.weatherForecast(weather))
                    } else if let errorData = decoder.map(ErrorResponse.self, from: dictionary) {
                        observer.onNext(.error(errorData))
                    }
                } else if let error = error as? URLError, error.code == .notConnectedToInternet {
                    observer.onNext(.error(ErrorResponse.noInternet(code: error.code.rawValue, message: error.localizedDescription)))
                } else {
                    observer.onNext(.error(.somethingwrong))
                }
                return
            })
            request.resume()
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
