//
//  FetchState.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 12/07/24.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case error(String)
}
