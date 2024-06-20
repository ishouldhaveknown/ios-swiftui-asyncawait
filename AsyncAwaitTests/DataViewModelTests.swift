//
//  DataViewModelTests.swift
//  AsyncAwaitTests
//
//  Created by Tomi on 20.06.24.
//

import XCTest
@testable import AsyncAwait

class MockFetchDataUseCase: FetchDataUseCaseProtocol {
    func execute() async throws -> String {
        return "Mock Data from Use Case"
    }
}

class DataViewModelTests: XCTestCase {
    var viewModel: DataViewModel!

    @MainActor 
    override func setUp() {
        super.setUp()
        let mockFetchDataUseCase = MockFetchDataUseCase()
        viewModel = DataViewModel(fetchDataUseCase: mockFetchDataUseCase)
    }

    @MainActor
    func testLoadDataSuccess() async {
        await viewModel.loadData()
        XCTAssertEqual(viewModel.data, "Mock Data from Use Case")
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    @MainActor
    func testLoadDataFailure() async {
        class MockFailingFetchDataUseCase: FetchDataUseCaseProtocol {
            func execute() async throws -> String {
                throw NSError(domain: "TestError", code: 1, userInfo: nil)
            }
        }

        viewModel = DataViewModel(fetchDataUseCase: MockFailingFetchDataUseCase())

        await viewModel.loadData()
        XCTAssertTrue(viewModel.data.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.errorMessage, "The operation couldn’t be completed. (TestError error 1.)")
    }
}
