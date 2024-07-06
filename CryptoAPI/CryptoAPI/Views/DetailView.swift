//
//  DetailView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import SwiftUI

struct DetailView: View {
    @State var viewModel = ContentViewModel()
    var data: Dado
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    Section{
                        HStack{
                            Text("Chave Pública")
                            Spacer()
                            Text("\(data.publicKey)")
                                .font(.caption2)
                        }
                        
                        HStack{
                            Text("Quantidade de Canais")
                            Spacer()
                            Text("\(data.channels)")
                        }
                        
                        HStack{
                            Text("Capacidade")
                            Spacer()
                            Text("\(viewModel.satsToBitconConversion(sats: data.capacity)) BTC")
                        }
                        
                        HStack{
                            Text("Data de Início")
                            Spacer()
                            Text("\(viewModel.formatUnixTime(TimeInterval(data.firstSeen)))")
                        }
                        
                        HStack{
                            Text("Última atualização")
                            Spacer()
                            Text("\(viewModel.formatUnixTime(TimeInterval(data.updatedAt)))")
                        }
                        
                        HStack{
                            Text("Localização")
                            Spacer()
                            Text((data.city?.ptBR ?? data.city?.en) ?? "")
                            Text(data.country?.ptBR ?? data.country?.en ?? "")
                        }
                    }
                }
            }
            .navigationTitle(data.alias)
        }
    }
}

#Preview {
    DetailView(data: APIRequest().data[0])
}
