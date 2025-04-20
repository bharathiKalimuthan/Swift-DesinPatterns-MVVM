//
//  MockNetworkService.swift
//  CurrencyConverterDemoTests
//
//  Created by BHARATHI K on 18/12/24.
//

// In MockNetworkService.swift
import Foundation
@testable import CurrencyConverterDemo
// Make the class and initializer accessible to other targets
class MockNetworkService: NetworkService {
 var mockResponse: Result<FixerResponse, Error>?
    
  override func fetchData(from url: String, completion: @escaping (Result<FixerResponse, Error>) -> Void) {
        if let mockResponse = mockResponse {
            completion(mockResponse)
        }
    }
    
    // Ensure the default initializer is available
    override init() {
        super.init()
    }
}
