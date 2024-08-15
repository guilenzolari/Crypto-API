//
//  ErrorView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    var errorDescription: String
    
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.triangle.fill")
                .scaleEffect(2.0, anchor: .center)
                .padding()
            
            Text(errorDescription)
                .padding()
                .multilineTextAlignment(.center)
            
            Button {
                viewModel.fetchNode()
            } label: {
                Text("Tentar Novamente")
                    .padding()
            }
        }.padding()
    }
}
