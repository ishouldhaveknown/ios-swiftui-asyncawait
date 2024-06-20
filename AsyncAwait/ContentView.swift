//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Tomi on 20.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DataViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                Text(viewModel.data)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadData()
            }
        }
        .padding()
    }
}
