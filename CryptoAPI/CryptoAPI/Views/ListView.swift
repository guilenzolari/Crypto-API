//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ListView: View {
    @Bindable var vm: ContentViewModel
    @State private var searchText = ""
    
    var filteredNode: [Node] {
        guard !searchText.isEmpty else { return vm.nodes }
        return vm.nodes.filter { $0.alias.localizedCaseInsensitiveContains(searchText)}
    }
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(filteredNode, id: \.self){ data in
                    VStack{
                        NavigationLink(data.alias, destination: DetailView(data: data))
                    }
                }
            }
            .navigationTitle("Principais Nodes da Rede Lightning")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: RefreshButton(vm: vm))
            .searchable(text: $searchText, prompt: "Buscar Node")
            .refreshable {
                vm.fetchNode()
            }
        }
    }
}
