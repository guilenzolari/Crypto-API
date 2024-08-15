//
//  RefreshButton.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import SwiftUI

struct RefreshButton: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        VStack{
            Image(systemName: "arrow.clockwise")
                .fontWeight(.regular)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    viewModel.fetchNode()
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
        }
    }
}
