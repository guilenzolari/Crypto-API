//
//  ViewInitial.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        switch viewModel.state {
        case .success:
            ListView()
        case .isLoading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2.0, anchor: .center)
        case .error(let errorDescription):
            ErrorView(errorDescription: errorDescription)
        }
    }
}

#Preview {
    ContentView()
}
