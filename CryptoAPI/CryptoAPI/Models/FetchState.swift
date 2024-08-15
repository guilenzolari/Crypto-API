//
//  FetchState.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import Foundation

enum FetchState: Comparable {
    case success
    case isLoading
    case error(String)
}
