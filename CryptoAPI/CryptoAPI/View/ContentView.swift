//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var api = APIRequest()
    
    var body: some View {
        NavigationView{
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
            }.onAppear{api.fetch()}
        }
    }
}

#Preview {
    ContentView()
}
