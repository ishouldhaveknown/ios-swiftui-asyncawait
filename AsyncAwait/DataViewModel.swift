//
//  DataViewModel.swift
//  AsyncAwait
//
//  Created by Tomi on 20.06.24.
//

import Foundation
import SwiftUI

@MainActor
class DataViewModel: ObservableObject {
    @Published var data: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let fetchDataUseCase: FetchDataUseCaseProtocol

    init(fetchDataUseCase: FetchDataUseCaseProtocol = FetchDataUseCase()) {
        self.fetchDataUseCase = fetchDataUseCase
    }

    func loadData() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await fetchDataUseCase.execute()
            data = result
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
