//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @State var vm = ContentViewModel(apiService: APIService())
    
    var body: some Scene {
        WindowGroup {
            switch vm.state {
            case .good:
                ListView(vm: vm)
            case .isLoading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
            case .error(let errorDescription):
                ErrorView(vm: vm, errorDescription: errorDescription)
            }
        }
    }
}
