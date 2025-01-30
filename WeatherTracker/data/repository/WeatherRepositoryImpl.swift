//
//  WeatherRepositoryImpl.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

class WeatherRepositoryImpl: WeatherRepository {
    private let remoteDataSource: WeatherAPI

    init(remoteDataSource: WeatherAPI) {
        self.remoteDataSource = remoteDataSource
    }

    func getWeather(for city: String) -> AnyPublisher<Weather, Error> {
        return remoteDataSource.fetchWeather(for: city)
    }

    func searchCity(query: String) -> AnyPublisher<[City], Error> {
        return remoteDataSource.searchCities(query: query)
    }
}
