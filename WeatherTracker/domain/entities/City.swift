//
//  City.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation

struct City: Codable, Identifiable {
    let id: Int
    let name: String
    let region: String
    let country: String
    
    var temperature: Double?  // fetched temperature
    var weatherIcon: String?  // fetched weather icon URL
}
