//
//  Repository.swift
//  AsyncAwait
//
//  Created by Tomi on 20.06.24.
//

import Foundation

protocol RepositoryProtocol {
    func getData() async throws -> String
}

class Repository: RepositoryProtocol {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func getData() async throws -> String {
        return try await apiService.fetchData()
    }
}
