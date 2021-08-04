//
//  UIImageView.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import Foundation
import Kingfisher

extension UIImageView {
    func downloadImage(from iconName: String, placeHolder: String? = nil, isBlur: Bool = false) {
        let baseURL: String = Configs.Network.weatherIconUrl
        if let placeholder = placeHolder {
            let placeholderImage = UIImage.init(named: placeholder)
            if let url = URL.init(string: "\(baseURL)\(iconName)@2x.png") {
                if isBlur == false {
                    kf.setImage(with: url, placeholder: placeholderImage)
                } else {
                    let processor = BlurImageProcessor.init(blurRadius: 6)
                    kf.setImage(with: url, placeholder: placeholderImage, options: [.processor(processor)])
                }
            } else {
                image = UIImage.init(named: placeholder)
            }
        } else {
            if let url = URL.init(string: "\(baseURL)\(iconName)@2x.png") {
                if isBlur == false {
                    kf.setImage(with: url)
                } else {
                    let processor = BlurImageProcessor.init(blurRadius: 6)
                    kf.setImage(with: url, placeholder: nil, options: [.processor(processor)])
                }
            } else {
                image = nil
            }
        }
    }
}
