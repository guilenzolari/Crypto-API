//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @StateObject var viewModel = ContentViewModel(apiService: APIService())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
