//
//  ContentView.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CurrencyViewModel
    init() {
           // You can choose between using a real or mock network service
           let realNetworkService = NetworkService()  // Use real service for production
           _viewModel = StateObject(wrappedValue: CurrencyViewModel(networkService: realNetworkService))  // Inject mock service for testing
       }
    var body: some View {
        TabView {
            RatingsView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Ratings")
                        }
                    
                    HistoryView()
                        .tabItem {
                            Image(systemName: "clock.fill")
                            Text("History")
                        }
                    
                    CurrencyConverterView()
                        .tabItem {
                            Image(systemName: "arrow.right.circle.fill")
                            Text("Converter")
                        }
                }
    }
}

struct CurrencyConverterView: View {
    var body: some View {
        Text("CurrencyConverter")
    }
}

struct HistoryView: View {
    var body: some View {
        Text("Historical Data")
    }
}

#Preview {
    ContentView()
}
