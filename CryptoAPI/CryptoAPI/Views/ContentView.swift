//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var api: APIRequest
    @State private var searchText = ""
    var filteredNode: [Dado] {
        guard !searchText.isEmpty else { return api.data }
        return api.data.filter { $0.alias.localizedCaseInsensitiveContains(searchText)}
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
            .navigationBarItems(trailing: RefreshButton(api: api))
            .searchable(text: $searchText, prompt: "Buscar Node")
            .refreshable {
                api.fetch()
            }
        }
    }
}

#Preview {
    ContentView(api: APIRequest())
}
