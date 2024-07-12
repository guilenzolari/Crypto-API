//
//  APIError.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
