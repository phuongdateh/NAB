//
//  UIViewController.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import Foundation
import UIKit

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UIViewController: Reusable {}

extension UIViewController {
    static func fromNib<T: UIViewController>(of: T.Type) -> T {
        return T.init(nibName: T.reuseID, bundle: nil)
    }
}
