//
//  WeatherView.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel(
            fetchWeatherUseCase: DependencyInjector.shared.fetchWeatherUseCase,
            searchCityUseCase: DependencyInjector.shared.searchCityUseCase
        )
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool
        
    var body: some View {
        VStack {
            searchBar

            Spacer(minLength: 15)
        
            if !searchText.isEmpty {
                searchResultsView
            } else if let weather = viewModel.weather {
                weatherDisplay(weather)
            } else {
                noCitySelectedView
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            viewModel.loadSavedCity() // Load city on app launch
        }
    }

    
    //MARK: - components
    
    //Search Bar UI (Only one search method used)
    private var searchBar: some View {
        HStack {
            TextField("Search Location", text: $searchText)
                .padding(10)
                .focused($isSearchFieldFocused)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 10)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
        .onChange(of: searchText) { newValue in
            if !newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                viewModel.searchCities(query: newValue)
            } else {
                viewModel.searchResults = [] // Clear search results
            }
        }

    }

    //Search Results List
    private var searchResultsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.searchResults) { city in
                    Button(action: {
                        searchText = ""
                        viewModel.fetchWeather(for: city.name)
                        hideKeyboard()
                        isSearchFieldFocused = false
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(city.name)
                                    .font(.headline)
                                Text("\(city.region), \(city.country)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "cloud.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }

    // Weather Display UI
    private func weatherDisplay(_ weather: Weather) -> some View {
        VStack {
            AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)

            
            Text(weather.location.name)
                .font(.title)
                .bold()
            
            Text("\(weather.current.temp_c, specifier: "%.0f")°")
                .font(.system(size: 60))
                .bold()
            
            HStack {
                weatherDetail("Humidity", value: "\(weather.current.humidity)%")
                Spacer()
                weatherDetail("UV", value: String(format: "%.0f", weather.current.uv))
                Spacer()
                weatherDetail("Feels Like", value: String(format: "%.0f°", weather.current.feelslike_c))
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }

    //"No City Selected" View
    private var noCitySelectedView: some View {
        VStack {
            Text("No City Selected")
                .font(.title)
                .bold()
            Text("Please Search For A City")
                .foregroundColor(.gray)
        }
    }

    //Weather Detail Box
    private func weatherDetail(_ title: String, value: String) -> some View {
        VStack {
            Text(title)
            Text(value).bold()
        }
    }
}

#Preview {
    WeatherView()
}

// MARK: - Hide Keyboard Extension
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
