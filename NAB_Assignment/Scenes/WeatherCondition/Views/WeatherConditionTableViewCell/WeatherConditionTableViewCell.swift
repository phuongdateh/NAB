//
//  WeatherConditionTableViewCell.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import UIKit

class WeatherConditionTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentLbl.numberOfLines = 0
    }
    
    func bind(viewModel: WeatherConditionViewModelItem) {
        if let _ = viewModel.condition {
            contentLbl.text = viewModel.content
        } else if let error = viewModel.error {
            contentLbl.text = error.message
        }
    }
}
