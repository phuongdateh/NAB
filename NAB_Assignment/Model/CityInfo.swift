//
//  CityInfo.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation

struct CityInfo: Decodable {
    
    let id: Int
    let name: String
    let country: String
    
    init() {
        self.id = 0
        self.name = ""
        self.country = ""
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
    }
}

extension CityInfo {
    static let `default`: CityInfo = {
        return CityInfo()
    }()
}
