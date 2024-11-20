//
//  PortfolioViewModel.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import Foundation

class PortfolioViewModel {
    var holdings: [Holding] = []
    
    func fetchHoldings(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchHoldings { [weak self] result in
            switch result {
            case .success(let holdings):
                self?.holdings = holdings
                completion()
            case .failure(let error):
                print("Failed to fetch holdings: \(error)")
                completion()
            }
        }
    }
    
    func profitOrLoss(for holding: Holding) -> Double {
        return (holding.ltp - holding.avgPrice) * Double(holding.quantity)
    }
}

