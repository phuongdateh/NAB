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
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    do {
                        if let weather = try? decoder.decode(WeatherForecast.self, from: data) {
                            observer.onNext(.weatherForecast(weather))
                        } else if let errorData = try? decoder.decode(ErrorResponse.self, from: data){
                            observer.onNext(.error(errorData))
                        }
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
