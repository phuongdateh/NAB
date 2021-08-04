//
//  UITableViewCell.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import Foundation
import UIKit

extension UITableViewCell: Reusable {}

extension UITableView {
    func dequeueReusableCell<T>(of cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Identifer invalid")
        }
        return cell
    }
}
