//
//  FetchWeatherUseCase.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

class FetchWeatherUseCase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository) {
        self.repository = repository
    }

    func execute(city: String) -> AnyPublisher<Weather, Error> {
        return repository.getWeather(for: city)
    }
}
