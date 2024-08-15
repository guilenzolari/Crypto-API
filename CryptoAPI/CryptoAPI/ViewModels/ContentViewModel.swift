//
//  ContentViewModel.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 04/07/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    let apiService: APIServiceProtocol
    @Published var nodes: [Node] = []
    @Published var state: FetchState = .success
    @Published var searchText = ""
    var filteredNode: [Node] {
        nodeFilter(searchText: searchText)
    }
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
        fetchNode()
    }
    
    func fetchNode() {
        state = .isLoading
        
        apiService.fetchData { [weak self] result in
            guard let self else {return}
            DispatchQueue.main.async {
                switch result{
                case .success(let results):
                    self.nodes = results
                    self.state = .success
                    print("fetched nodes: \(results)")
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
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
    
    private func nodeFilter(searchText: String) -> [Node] {
        guard !searchText.isEmpty else { return nodes }
        return nodes.filter { $0.alias.localizedCaseInsensitiveContains(searchText)}
    }
    
}
