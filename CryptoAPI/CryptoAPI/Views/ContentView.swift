//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = ContentViewModel()

    var body: some View {
        switch vm.state {
        case .good:
            ListView(vm: vm)
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

#Preview {
    ContentView()
}
