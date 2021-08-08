//
//  WeatherConditionTableViewCell.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/4/21.
//

import UIKit

class WeatherConditionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var averageTempLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func bind(viewModel: WeatherConditionViewModelItem) {
        switch viewModel {
        case .condition(let condition):
            dateLbl.text = "Date: \(condition.dateString)"
            averageTempLbl.text = "Average Temperature: \(condition.temp.average)°C"
            pressureLbl.text = "Pressure: \(condition.pressure)"
            humidityLbl.text = "Humidity: \(condition.humidity)%"
            if condition.weather.isEmpty == false {
                descriptionLbl.text = "Description: \(condition.weather[0].description)"
                weatherIconImageView.downloadImage(from: condition.weather[0].icon)
            }
        case .error(let error):
            dateLbl.text = ""
            averageTempLbl.text = ""
            humidityLbl.text = ""
            descriptionLbl.text = ""
            pressureLbl.text = error.message
            weatherIconImageView.image = nil
        }
    }
}
