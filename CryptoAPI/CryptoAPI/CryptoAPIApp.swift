//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @State var api = APIRequest()
    
    var body: some Scene {
        WindowGroup {
            if api.data.isEmpty{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
                    .onAppear{api.fetch()}
            } else {
                ContentView(api: api)
            }
        }
    }
}
