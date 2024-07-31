//
//  APIRequest.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import Foundation

class APIService: APIServiceProtocol {
    
    private let url = "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity"
    
    public func fetchData(completion: @escaping (Result<[Node], APIError>) -> () ){
        
        guard let url = URL(string: url) else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode([Node].self, from: data)
                        completion(Result.success(result))
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
