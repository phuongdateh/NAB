//
//  WeatherConditionUsecase.swift
//  NAB_Assignment
//
//  Created by Doan Duy Phuong on 08/08/2021.
//

import Foundation
import RxCocoa

class WeatherConditionUsecase: IUsecase {
    var provider: WeatherAPI
    
    init(provider: WeatherAPI) {
        self.provider = provider
    }
    
    func getForecastDaily(cityName: String) -> Driver<[WeatherConditionViewModelItem]> {
        return provider.getForecastDaily(by: cityName)
            .asDriverOnErrorJustComplete()
            .map { response -> [WeatherConditionViewModelItem] in
                return response.toWeatherConditionViewModelItem()
            }
    }
}
