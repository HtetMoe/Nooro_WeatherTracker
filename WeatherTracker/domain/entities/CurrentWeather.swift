//
//  CurrentWeather.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation

struct CurrentWeather: Codable {
    let temp_c: Double
    let condition: Condition
    let humidity: Int
    let uv: Double
    let feelslike_c: Double
}
