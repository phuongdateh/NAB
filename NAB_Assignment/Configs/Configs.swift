//
//  Configs.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

struct Configs {
    static let apiVersion = "2.5"
    struct Network {
        static let appId: String = "60c6fbeb4b93ac653c492ba806fc346d"
        static let weatherUrl: String = "https://api.openweathermap.org/data/\(Configs.apiVersion)"
    }
}
