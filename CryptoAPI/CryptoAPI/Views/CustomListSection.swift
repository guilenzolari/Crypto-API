//
//  CustomListSection.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 11/07/24.
//

import SwiftUI

struct CustomListSection: View {
    @State var fieldName: String
    @State var fieldInfo: Any?
    
    var body: some View {
        if let data = fieldInfo {
            HStack{
                Text(fieldName)
                    .foregroundStyle(Color.gray)
                Spacer()
                Text("\(data)")
            }
        }
    }
}
