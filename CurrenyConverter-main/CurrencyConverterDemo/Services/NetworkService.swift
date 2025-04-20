//
//  NetworkService.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//

import Foundation

class NetworkService {
    
    // A method to fetch data with completion handler
   public func fetchData(from url: String, completion: @escaping (Result<FixerResponse, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(FixerResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
