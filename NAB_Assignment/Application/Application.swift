//
//  Application.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation
import UIKit

class Application: NSObject {
    
    static let shared = Application()
    
    var window: UIWindow?
    private var provider: WeatherAPI?
    private let navigator: Navigator
    
    override init() {
        self.navigator = Navigator.default
        self.provider = WeatherAPIService()
        super.init()
    }
    
    func presentView(with window: UIWindow?) {
        guard let window = window,
              let provider = provider else { return }
        self.window = window
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {[weak self] in
            guard let weakSelf = self else { return }
            let usecase = WeatherConditionUsecase(provider: provider)
            let viewModel = WeatherConditionViewModel(usecase: usecase)
            weakSelf.navigator.show(segue: .weatherCondition(viewModel), sender: nil, transition: .root(in: window))
        })
    }
}
