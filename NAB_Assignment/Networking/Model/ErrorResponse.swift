//
//  ErrorResponse.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let cod: String
    let message: String
}
