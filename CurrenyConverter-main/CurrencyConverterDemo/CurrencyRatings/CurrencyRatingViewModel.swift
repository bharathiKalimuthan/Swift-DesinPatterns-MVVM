//
//  CurrencyRatingViewModel.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    private let networkService: NetworkService

    @Published var rates: [String: Double] = [:]
    @Published var error: String?

    init(networkService: NetworkService) {
        self.networkService = networkService
        fetchExchangeRates()
    }

    func fetchExchangeRates() {
        let apiKey = "" // Replace with actual access key
        let url = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
        
        networkService.fetchData(from: url) { result in
            switch result {
                        case .success(let response):
                            if response.success {
                                self.rates = response.rates
                            } else {
                                self.error = "Failed to fetch exchange rates."
                            }
                        case .failure(let error):
                            self.error = "Failed to load data: \(error.localizedDescription)"
                        }
        }
    }
}
