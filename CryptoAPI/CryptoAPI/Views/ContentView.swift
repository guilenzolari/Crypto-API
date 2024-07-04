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
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(api.data, id: \.self){ data in
                    VStack{
                        NavigationLink(data.alias, destination: DetailView(data: data))
                    }
                }
            }
            .navigationTitle("Principais Nodes da Rede Lightning")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: RefreshButton(api: api))
            .searchable(text: $searchText, prompt: "Buscar")
            .refreshable {
                api.fetch()
            }
        }
    }
}

#Preview {
    ContentView(api: APIRequest())
}
