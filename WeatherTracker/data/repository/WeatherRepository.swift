//
//  WeatherRepository.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

protocol WeatherRepository {
    
    func getWeather(for city: String) -> AnyPublisher<Weather, Error>
    
    func searchCity(query: String) -> AnyPublisher<[City], Error>
}
