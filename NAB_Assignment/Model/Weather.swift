//
//  Weather.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
