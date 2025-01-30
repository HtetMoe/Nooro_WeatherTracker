//
//  NetworkServiceProtocol.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(path: String, queryItems: [URLQueryItem]) -> AnyPublisher<T, Error>
}
