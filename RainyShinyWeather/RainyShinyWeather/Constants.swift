//
//  Constants.swift
//  RainyShinyWeather
//
//  Created by Arpita Bhatia on 2/6/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "9c1e00c3d510331189d2c566bda463c3"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)26.4499\(LONGITUDE)74.6399\(APP_ID)\(API_KEY)"
typealias DownloadComplete = () -> ()

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=26.4499&lon=74.6399&cnt=10&mode=json&appid=9c1e00c3d510331189d2c566bda463c3"


