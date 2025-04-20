//
//  CurrencyRatingsModel.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//

import Foundation

// Model for the API response
public struct FixerResponse: Codable {
    let success: Bool
    let base: String
    let date: String
    let rates: [String: Double] // A dictionary for currency rates
}

