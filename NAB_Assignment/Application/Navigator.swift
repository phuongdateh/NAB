//
//  Navigator.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation
import UIKit

protocol Navigatable {
    var navigator: Navigator! { get set }
}

class Navigator {
    static var `default` = Navigator()

    // MARK: - segues list, all app scenes
    enum Scene {
        case weatherCondition(WeatherConditionViewModel)
    }
    
    enum Transition {
        case root(in: UIWindow)
        case push
    }
}

extension Navigator {
    func get(segue: Scene) -> UIViewController? {
        switch segue {
        case .weatherCondition(let viewModel):
            let vc = WeatherConditionViewController.fromNib(of: WeatherConditionViewController.self)
            vc.setupComponent(viewModel: viewModel, navigator: self)
            return UINavigationController(rootViewController: vc)
        }
    }
    
    func show(segue: Scene, sender: UIViewController?, transition: Transition) {
        if let target = get(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root(in: let window):
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = target
            }, completion: nil)
            return
        case .push:
            if let navitaionController = sender?.navigationController {
                navitaionController.pushViewController(target, animated: true)
            }
        }
    }
}
