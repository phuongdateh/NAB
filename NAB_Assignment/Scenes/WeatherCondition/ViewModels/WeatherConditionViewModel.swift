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
    
    private let usecase: WeatherConditionUsecase
    
    init(usecase: WeatherConditionUsecase) {
        self.usecase = usecase
    }
    
    func transform(input: Input) -> Output {
        let items = input.keywordTrigger
            .debounce(DispatchTimeInterval.seconds(2))
            .filter({ (text) in
                if text.count >= 3 {
                    return true
                }
                return false
            })
            .flatMapLatest { (keyword) in
                return self.usecase.getForecastDaily(cityName: keyword)
                    .trackActivity(self.loading)
                    .asDriverOnErrorJustComplete()
            }
        return Output(items: items)
    }
    
}
