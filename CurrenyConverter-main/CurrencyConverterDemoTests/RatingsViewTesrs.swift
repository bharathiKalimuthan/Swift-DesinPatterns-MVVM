//
//  RatingsViewTesrs.swift
//  CurrencyConverterDemoTests
//
//  Created by BHARATHI K on 18/12/24.
//


import XCTest
import SwiftUI
@testable import CurrencyConverterDemo

class RatingsViewTests: XCTestCase {
    
    var viewModel: CurrencyViewModel!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        
        // Mock network service for testing
        mockNetworkService = MockNetworkService()
        
        // Initialize the ViewModel with the mock network service
        viewModel = CurrencyViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testRatingsViewDisplayRates() {
        // Given a mock successful response
        let mockRates = ["USD": 1.1859, "EUR": 1.0, "GBP": 0.8646]
        let mockResponse = FixerResponse(success: true, base: "EUR", date: "2024-12-18", rates: mockRates)
        mockNetworkService.mockResponse = .success(mockResponse)
        
        // When the view model fetches exchange rates
        viewModel.fetchExchangeRates()
        
        // Then the rates should be correctly populated
        XCTAssertEqual(viewModel.rates["USD"], 1.1859, "USD exchange rate should be 1.1859.")
        XCTAssertEqual(viewModel.rates["GBP"], 0.8646, "GBP exchange rate should be 0.8646.")
    }
    
    func testRatingsViewErrorState() {
        // Given an error scenario from the network
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)
        mockNetworkService.mockResponse = .failure(mockError)
        
        // When the view model fetches exchange rates
        viewModel.fetchExchangeRates()
        
        // Then the error message should be set
        XCTAssertNotNil(viewModel.error, "ViewModel should have an error message.")
        XCTAssertEqual(viewModel.error, "Failed to load data: The operation couldn’t be completed. (Test error 0.)", "Error message should match the expected message.")
    }
}
