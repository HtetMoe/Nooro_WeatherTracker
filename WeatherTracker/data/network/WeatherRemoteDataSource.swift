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
//        return networkService.request(endpoint: "current.json", queryItems: [
//            URLQueryItem(name: "q", value: city)
//        ])
//    }
//
//    func searchCities(query: String) -> AnyPublisher<[City], Error> {
//        return networkService.request(endpoint: "search.json", queryItems: [
//            URLQueryItem(name: "q", value: query)
//        ])
//    }
//}

class WeatherRemoteDataSource: WeatherAPI {
    
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
        return networkService.request(path: Endpoint.Paths.currentWeather, queryItems: [
            URLQueryItem(name: "q", value: city)
        ])
    }

    func searchCities(query: String) -> AnyPublisher<[City], Error> {
        return networkService.request(path: Endpoint.Paths.searchCity, queryItems: [
            URLQueryItem(name: "q", value: query)
        ])
    }
}
