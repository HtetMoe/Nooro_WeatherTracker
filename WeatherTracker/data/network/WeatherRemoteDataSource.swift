//
//  WeatherRemoteDataSource.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

//class WeatherRemoteDataSource: WeatherAPI {
//    
//    private let networkService: NetworkServiceProtocol
//
//    init(networkService: NetworkServiceProtocol = NetworkService()) {
//        self.networkService = networkService
//    }
//
//    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
//        return networkService.request(path: Endpoint.Paths.currentWeather, queryItems: [
//            URLQueryItem(name: "q", value: city)
//        ])
//    }
//
//    func searchCities(query: String) -> AnyPublisher<[City], Error> {
//        return networkService.request(path: Endpoint.Paths.searchCity, queryItems: [
//            URLQueryItem(name: "q", value: query)
//        ])
//    }
//}

import Foundation
import Combine

class WeatherRemoteDataSource: WeatherAPI {
    
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // Fetches weather for a given city (Must return AnyPublisher<Weather, Error> to conform to WeatherAPI)
    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
        return networkService.request(path: Endpoint.Paths.currentWeather, queryItems: [
            URLQueryItem(name: "q", value: city)
        ])
        .eraseToAnyPublisher() // Ensure it matches AnyPublisher<Weather, Error>
    }

    // Searches for cities and fetches temperature & weather icon
    func searchCities(query: String) -> AnyPublisher<[City], Error> {
        return networkService.request(path: Endpoint.Paths.searchCity, queryItems: [
            URLQueryItem(name: "q", value: query)
        ])
        .flatMap { (cities: [City]) -> AnyPublisher<[City], Error> in
            let publishers = cities.map { city in
                self.fetchWeather(for: city.name)
                    .map { weather -> City in
                        var updatedCity = city
                        updatedCity.temperature = weather.current.temp_c
                        updatedCity.weatherIcon = weather.current.condition.icon
                        return updatedCity
                    }
                    .catch { _ in Just(city) } // Handle API errors by returning the original city
                    .setFailureType(to: Error.self) // Ensures it matches AnyPublisher<City, Error>
                    .eraseToAnyPublisher()
            }
            return Publishers.MergeMany(publishers)
                .collect()
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}

