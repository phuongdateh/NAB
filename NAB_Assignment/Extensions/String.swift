//
//  String.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation

extension String {
    func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
