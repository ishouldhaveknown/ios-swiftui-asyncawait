//
//  FetchDataUseCase.swift
//  AsyncAwait
//
//  Created by Tomi on 20.06.24.
//

import Foundation

protocol FetchDataUseCaseProtocol {
    func execute() async throws -> String
}

class FetchDataUseCase: FetchDataUseCaseProtocol {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
    }

    func execute() async throws -> String {
        return try await repository.getData()
    }
}
