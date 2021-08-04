//
//  Temperature.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation

struct Temperature: Decodable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let morn: Double
}

extension Temperature {
    static let `default`: Temperature = {
        return .init(day: 0,
                     min: 0,
                     max: 0,
                     night: 0,
                     morn: 0)
    }()
    
    var average: Int {
        get {
            return Int(min + max) / 2
        }
    }
}
