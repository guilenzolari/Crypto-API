//
//  RefreshButton.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import SwiftUI

struct RefreshButton: View {
    @Bindable var api: APIRequest
    
    var body: some View {
        VStack{
            Image(systemName: "arrow.clockwise")
                .fontWeight(.regular)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    api.fetch()
                }
        }
    }
}

#Preview {
    RefreshButton(api: APIRequest())
}
