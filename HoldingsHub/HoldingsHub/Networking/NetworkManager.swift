//
//  NetworkManager.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import Foundation


 final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchHoldings(completion: @escaping (Result<[Holding], Error>) -> Void) {
        let urlString = "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(apiResponse.data.userHolding))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
