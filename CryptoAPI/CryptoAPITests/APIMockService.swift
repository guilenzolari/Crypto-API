//
//  APIMockService.swift
//  CryptoAPITests
//
//  Created by Guilherme Ferreira Lenzolari on 15/07/24.
//

import Foundation
@testable import CryptoAPI

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Node], APIError>
    
    public func fetchData(completion: @escaping (Result<[Node], APIError>) -> () ){
        completion(result)
    }
}
