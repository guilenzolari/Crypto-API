//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var api = APIRequest()
    
    var body: some View {
        NavigationView{
            if api.data.isEmpty{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
                    .onAppear{api.fetch()}
            } else {
                List {
                    ForEach(api.data, id: \.self){ data in
                        VStack{
                            Text(data.alias)
                            Text(data.publicKey)
                            Text(String(data.channels))
                            Text(String(data.capacity))
                            Text(String(data.firstSeen))
                            Text(String(data.updatedAt))
                            Text((data.city?.ptBR ?? data.city?.en) ?? "")
                            Text(data.country?.ptBR ?? data.country?.en ?? "")
                        }
                    }
                    .padding()
                }
                .navigationTitle("Principais Nodes da Rede Lightning")
                    .navigationBarTitleDisplayMode(.inline)

                .navigationBarItems(trailing: RefreshButton(api: api))
            }
        }
    }
}

#Preview {
    ContentView()
}
