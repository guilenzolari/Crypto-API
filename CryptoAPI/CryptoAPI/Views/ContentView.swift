//
//  ContentView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var api: APIRequest
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(api.data, id: \.self){ data in
                    VStack{
                        Text(data.alias)
                            .font(.title2).bold()
                        Text("Chave pública: \(data.publicKey)")
                        Text("Quantidade de Canais: \(data.channels)")
                        Text("Capacidade: \(viewModel.satsToBitconConversion(sats: data.capacity)) BTC")
                        Text("firstSeen: \(viewModel.formatUnixTime(TimeInterval(data.firstSeen)))")
                        Text("Última atualização: \(viewModel.formatUnixTime(TimeInterval(data.updatedAt)))")
                        
                        HStack{
                            Text("Localização:")
                            Text((data.city?.ptBR ?? data.city?.en) ?? "")
                            Text(data.country?.ptBR ?? data.country?.en ?? "")
                        }
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

#Preview {
    ContentView(api: APIRequest())
}
