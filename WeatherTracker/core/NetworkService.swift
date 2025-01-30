//
//  NetworkService.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

class NetworkService: NetworkServiceProtocol {
    
    func request<T: Decodable>(path: String, queryItems: [URLQueryItem]) -> AnyPublisher<T, Error> {
        
        var components = URLComponents(string: "\(Endpoint.baseURL)\(path)")
        var allQueryItems = queryItems
       
        allQueryItems.append(URLQueryItem(name: "key", value: Endpoint.apiKey))
        components?.queryItems = allQueryItems

        guard let url = components?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

