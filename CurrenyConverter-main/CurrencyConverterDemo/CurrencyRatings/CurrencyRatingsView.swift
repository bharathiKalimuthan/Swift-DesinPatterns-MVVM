//
//  CurrencyRatingsView.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//
import SwiftUI
// RatingsView displaying the rates fetched via the ViewModel

struct RatingsView: View {
    @ObservedObject var viewModel: CurrencyViewModel

    var body: some View {
        VStack {
            if viewModel.rates.isEmpty {
                Text("No data available")
                    .font(.title)
                    .padding()
            } else {
                List(viewModel.rates.keys.sorted(), id: \.self) { currency in
                    HStack {
                        Text(currency)
                        Spacer()
                        Text(String(format: "%.4f", viewModel.rates[currency]!))
                            .bold()
                    }
                    .padding()
                }
            }

            // Show error message if there is an error
            if let errorMessage = viewModel.error {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            // Fetch rates when the view appears
            viewModel.fetchExchangeRates()
        }
        .navigationBarTitle("Currency Rates", displayMode: .inline)
    }
}
