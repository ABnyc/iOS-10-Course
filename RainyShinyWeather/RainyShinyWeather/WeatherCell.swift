//
//  WeatherCell.swift
//  RainyShinyWeather
//
//  Created by Arpita Bhatia on 2/7/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!

    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    
    func configureCell(forecast: Forecast) {
        lowTempLbl.text = "\(forecast.lowTemp)"
        highTempLbl.text = "\(forecast.highTemp)"
        weatherTypeLbl.text = forecast.weatherType
        dayLbl.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
   

}
