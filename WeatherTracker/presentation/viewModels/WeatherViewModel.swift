//
//  WeatherViewModel.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var weather: Weather?
    @Published var searchResults: [City] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let fetchWeatherUseCase: FetchWeatherUseCase
    private let searchCityUseCase: SearchCityUseCase

    init(
        fetchWeatherUseCase: FetchWeatherUseCase,
        searchCityUseCase: SearchCityUseCase
    ) {
        self.fetchWeatherUseCase = fetchWeatherUseCase
        self.searchCityUseCase = searchCityUseCase
        
        loadSavedCity() // Load saved city on app launch
    }

    //fetch weather
    func fetchWeather(for city: String) {
        isLoading = true
        fetchWeatherUseCase.execute(city: city)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure = completion {
                    self.errorMessage = "Failed to fetch weather."
                }
            }, receiveValue: { [weak self] weather in
                self?.weather = weather
                self?.saveCity(city) // Save city when fetched
            })
            .store(in: &cancellables)
    }

    //search cities
    func searchCities(query: String) {
        searchCityUseCase.execute(query: query)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    self.errorMessage = "Failed to fetch search results."
                }
            }, receiveValue: { [weak self] results in
                self?.searchResults = results
            })
            .store(in: &cancellables)
    }

    //save to UserDefaults
    private func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: "savedCity")
    }

  
    //load selected city
    func loadSavedCity() {
        if let savedCity = UserDefaults.standard.string(forKey: "savedCity") {
            fetchWeather(for: savedCity)
        }
    }
}
