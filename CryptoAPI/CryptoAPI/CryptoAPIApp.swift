//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @StateObject var vm = ContentViewModel(apiService: APIService())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
