//
//  Weather.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import SwiftUI

struct Weather: Codable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Codable {
    let name: String
}

struct CurrentWeather: Codable {
    let temp_c: Double
    let condition: Condition
    let humidity: Int
    let uv: Double
    let feelslike_c: Double
}

struct Condition: Codable {
    let text: String
    let icon: String
}

struct City: Codable, Identifiable {
    let id: Int
    let name: String
    let region: String
    let country: String
}
