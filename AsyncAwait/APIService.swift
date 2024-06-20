//
//  APIService.swift
//  AsyncAwait
//
//  Created by Tomi on 20.06.24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchData() async throws -> String
}

class APIService: APIServiceProtocol {
    func fetchData() async throws -> String {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "Data from API"
    }
}
