//
//  APIRequest.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import Foundation

@Observable
class APIRequest {
    
    var data: [Dado] = []
    let url = "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity"
    
    func fetch(){
        guard let url = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let data = try JSONDecoder().decode([Dado].self, from: data)
                
                DispatchQueue.main.async {
                    self?.data = data
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
