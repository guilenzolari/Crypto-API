//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var api = APIRequest()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            api.fetch()
        }
    }
}

#Preview {
    ContentView()
}
