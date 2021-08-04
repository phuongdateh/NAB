//
//  WeatherAPI.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation
import RxSwift

protocol WeatherAPI {
    func getForecastDaily(by cityName: String) -> Observable<WeatherResponse>
}
