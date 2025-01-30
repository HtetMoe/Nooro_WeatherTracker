//
//  EndPoint.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://api.weatherapi.com/v1"
    static let apiKey = "c7772e83577e4b7d8ec13600252901"

    struct Paths {
        static let currentWeather = "/current.json"
        static let searchCity = "/search.json"
    }
}
