//
//  RefreshButton.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import SwiftUI

struct RefreshButton: View {
    var body: some View {
        VStack{
            Image(systemName: "arrow.clockwise")
                .resizable()
                .fontWeight(.regular)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    
                }
        }
    }
}

#Preview {
    RefreshButton()
}
