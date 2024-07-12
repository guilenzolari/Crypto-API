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
            if vm.nodes.isEmpty{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
                    .onAppear{vm.fetchNode()}
            } else {
                ContentView(vm: vm)
            }
        }
    }
}
