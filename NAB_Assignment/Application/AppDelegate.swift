//
//  AppDelegate.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Application.shared.presentView(with: window)
        
        return true
    }
}

