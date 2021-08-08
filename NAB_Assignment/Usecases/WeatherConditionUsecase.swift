//
//  WeatherConditionUsecase.swift
//  NAB_Assignment
//
//  Created by Doan Duy Phuong on 08/08/2021.
//

import Foundation
import RxSwift

class WeatherConditionUsecase: IUsecase {
    var provider: WeatherAPI
    
    init(provider: WeatherAPI) {
        self.provider = provider
    }
    
    func getForecastDaily(cityName: String) -> Observable<WeatherResponse>  {
        return provider.getForecastDaily(by: cityName)
    }
}
