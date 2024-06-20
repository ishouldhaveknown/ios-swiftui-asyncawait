//
//  APIServiceTests.swift
//  AsyncAwaitTests
//
//  Created by Tomi on 20.06.24.
//

import XCTest
@testable import AsyncAwait

class APIServiceTests: XCTestCase {
    var apiService: APIService!

    override func setUp() {
        super.setUp()
        apiService = APIService()
    }

    func testFetchData() async throws {
        let data = try await apiService.fetchData()
        XCTAssertEqual(data, "Data from API")
    }
}
