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
        
        VStack{
            Text(data.alias)
                .font(.title2).bold()
                .padding()
            
            Text("\(data.publicKey)")
                .font(.caption2)
            
            HStack{
                Text("Quantidade de Canais:")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text("\(data.channels)")
                
            }
            
            HStack{
                Text("Capacidade:")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text("\(viewModel.satsToBitconConversion(sats: data.capacity)) BTC")
            }
            
            HStack{
                Text("Data de Início:")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text("\(viewModel.formatUnixTime(TimeInterval(data.firstSeen)))")
            }
            
            HStack{
                Text("Última atualização:")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text("\(viewModel.formatUnixTime(TimeInterval(data.updatedAt)))")
            }
            
            HStack{
                Text("Localização:")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text((data.city?.ptBR ?? data.city?.en) ?? "")
                Text(data.country?.ptBR ?? data.country?.en ?? "")
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    DetailView(data: APIRequest().data[0])
}
