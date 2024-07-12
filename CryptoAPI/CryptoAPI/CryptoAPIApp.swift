//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @State var vm = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            switch vm.state {
            case .good:
                ContentView(vm: vm)
                    .onAppear{
                        vm.fetchNode()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
                    .onAppear{vm.fetchNode()}
            case .error(let errorDescription):
                ErrorView(vm: vm, errorDescription: errorDescription)
            }
        }
    }
}
