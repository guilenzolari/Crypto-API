//
//  ContentViewModel.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import Foundation

@Observable
class ContentViewModel {
    func satsToBitconConversion(sats: Int) -> Float{
        let satoshis = Float(sats)
        return satoshis/100000000
    }
    
    func formatUnixTime(_ timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let date = Date(timeIntervalSince1970: timestamp)
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}
