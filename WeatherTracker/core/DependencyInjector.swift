//
//  DependencyInjector.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation

class DependencyInjector {
    static let shared = DependencyInjector()

    private init() {}

    private let networkService   = NetworkService()
    private let remoteDataSource = WeatherRemoteDataSource(networkService: NetworkService())
    private lazy var repository  = WeatherRepositoryImpl(remoteDataSource: remoteDataSource)

    lazy var fetchWeatherUseCase = FetchWeatherUseCase(repository: repository)
    lazy var searchCityUseCase   = SearchCityUseCase(repository: repository)
}

