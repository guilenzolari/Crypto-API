//
//  ContentViewModel.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import Foundation

@Observable
class ContentViewModel {
    let apiService: APIServiceProtocol
    var nodes: [Node] = []
    var state: FetchState = .good
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
        fetchNode()
    }
    
    func fetchNode() {
        self.state = .isLoading
        
        apiService.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let results):
                    self?.nodes = results
                    self?.state = .good
                    print("fetched nodes: \(results)")
                case .failure(let error):
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
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
