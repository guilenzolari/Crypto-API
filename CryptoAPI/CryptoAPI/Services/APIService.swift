//
//  APIRequest.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import Foundation

@Observable
class APIService {
    
    private let url = "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity"
    
    public func fetchData(completion: @escaping ([Node]) -> () ){
        guard let url = URL(string: url) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            if let error = error {
                print("urlsession error: \(error.localizedDescription)")
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode([Node].self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
