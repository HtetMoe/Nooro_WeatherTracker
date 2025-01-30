//
//  WeatherAPI.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

//MARK: - handle API requests
protocol WeatherAPI {
    
    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error>
    
    func searchCities(query: String) -> AnyPublisher<[City], Error>
}
