//
//  WeatherConditionViewModel.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation
import RxCocoa
import RxSwift

class WeatherConditionViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let keywordTrigger: Driver<String>
    }
    
    struct Output {
        let items: Driver<[WeatherConditionViewModelItem]>
    }
    
    func transform(input: Input) -> Output {
        let items = input.keywordTrigger
            .filter({ (text) in
                if text.count >= 3 {
                    return true
                }
                return false
            })
            .flatMapLatest { (keyword) in
                return self.provider.getForecastDaily(by: keyword)
                    .trackActivity(self.loading)
                    .asDriverOnErrorJustComplete()
                    .map { results -> [WeatherConditionViewModelItem] in
                        if let data = results.weatherForecast {
                            let items = data.weatherConditions.map{( $0.toWeatherConditionViewModelItem())}
                            return items
                        } else {
                            return [results.toWeatherConditionViewModelItem()]
                        }
                    }
            }
        return Output(items: items)
    }
    
}
