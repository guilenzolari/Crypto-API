//
//  ViewInitial.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        switch vm.state {
        case .good:
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
