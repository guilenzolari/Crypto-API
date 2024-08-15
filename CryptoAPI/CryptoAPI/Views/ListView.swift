//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(viewModel.filteredNode, id: \.self){ data in
                    VStack{
                        NavigationLink(data.alias, destination: DetailView(data: data))
                    }
                }
            }
            .navigationTitle("Principais Nodes da Rede Lightning")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: RefreshButton())
            .searchable(text: $viewModel.searchText, prompt: "Buscar Node")
            .refreshable {
                viewModel.fetchNode()
            }
        }
    }
}
