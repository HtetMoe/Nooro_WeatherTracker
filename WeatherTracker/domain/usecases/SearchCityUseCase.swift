//
//  SearchCityUseCase.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

class SearchCityUseCase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository) {
        self.repository = repository
    }

    func execute(query: String) -> AnyPublisher<[City], Error> {
        return repository.searchCity(query: query)
    }
}

