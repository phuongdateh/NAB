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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = (try? container.decode(Int.self, forKey: .id)) ?? 404
        main = (try? container.decode(String.self, forKey: .main)) ?? ""
        description = (try? container.decode(String.self, forKey: .description)) ?? ""
        icon = (try? container.decode(String.self, forKey: .icon)) ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
