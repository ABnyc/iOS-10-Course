//
//  Location.swift
//  RainyShinyWeather
//
//  Created by Arpita Bhatia on 2/9/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import CoreLocation


class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    
}
