//
//  DetailView.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import SwiftUI

struct DetailView: View {
    @State var viewModel = ContentViewModel()
    var data: Node
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    Section(header: Text("Public Key")){
                        HStack{
                            Text("\(data.publicKey)")
                                .font(.caption2)
                        }
                    }
                    
                    Section{
                        CustomListSection(fieldName: "Quantidade de Canais", fieldInfo: data.channels)
                        CustomListSection(fieldName: "Capacidade (BTC)", fieldInfo: String(format: "%.2f", viewModel.satsToBitconConversion(sats: data.capacity)))
                    }
                    
                    Section{
                        CustomListSection(fieldName: "Data de Início", fieldInfo: viewModel.formatUnixTime(TimeInterval(data.firstSeen)))
                        CustomListSection(fieldName: "Última atualização", fieldInfo: viewModel.formatUnixTime(TimeInterval(data.updatedAt)))
                    }
                    
                    Section(header: Text("Localização")){
                        CustomListSection(fieldName: "Cidade", fieldInfo: data.city?.ptBR ?? data.city?.en)
                        CustomListSection(fieldName: "País", fieldInfo: data.country?.ptBR ?? data.country?.en)
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
