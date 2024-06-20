//
//  RepositoryTests.swift
//  AsyncAwaitTests
//
//  Created by Tomi on 20.06.24.
//

import XCTest
@testable import AsyncAwait

class MockAPIService: APIServiceProtocol {
    func fetchData() async throws -> String {
        return "Mock Data"
    }
}

class RepositoryTests: XCTestCase {
    var repository: Repository!

    override func setUp() {
        super.setUp()
        let mockAPIService = MockAPIService()
        repository = Repository(apiService: mockAPIService)
    }

    func testGetData() async throws {
        let data = try await repository.getData()
        XCTAssertEqual(data, "Mock Data")
    }
}
