//
//  APIServiceProtocol.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import Foundation

protocol APIServiceProtocol: AnyObject {
    func fetchData(completion: @escaping (Result<[Node], APIError>) -> ())
}
