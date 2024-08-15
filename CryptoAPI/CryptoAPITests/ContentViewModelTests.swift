//
//  ContentViewModelTests.swift
//  CryptoAPITests
//
//  Created by Guilherme Ferreira Lenzolari on 15/07/24.
//

import XCTest
@testable import CryptoAPI
import Combine

final class ContentViewModelTests: XCTestCase {
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_nodes_success() {
        
        let result = Result<[Node], APIError>.success([Node.example1()])
        let fetcher = ContentViewModel(apiService: APIMockService(result: result))
        
        let promise = expectation(description: "getting nodes")
        
        fetcher.$nodes.sink { nodes in
            if nodes.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    func test_loading_error() {
        let result = Result<[Node], APIError>.failure(APIError.badURL)
        let fetcher = ContentViewModel(apiService: APIMockService(result: result))

        let promise = expectation(description: "show error message")
        fetcher.$nodes.sink{ nodes in
            if !nodes.isEmpty{
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        fetcher.$state.sink { state in
            if case .error(_) = state {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    func test_formatUnixTime() {
        let timeStamp: TimeInterval = 1522941222
        
        let result = Result<[Node], APIError>.failure(APIError.badURL)
        let viewModel = ContentViewModel(apiService: APIMockService(result: result))

        let time = viewModel.formatUnixTime(timeStamp)
        
        XCTAssertEqual(time, "05/04/2018 12:13:42")
    }
    
}
