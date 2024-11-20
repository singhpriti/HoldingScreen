//
//  Holding.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import Foundation

struct Holding: Codable {
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double
    
    var pnl: Double {
        return (ltp - avgPrice) * Double(quantity)
    }
   var currentValue: Double {
       return ltp * Double(quantity)
   }
   
   var investmentValue: Double {
       return avgPrice * Double(quantity)
   }
   
   var todayPnl: Double {
       return (close - ltp) * Double(quantity)
   }
}

struct PortfolioData: Codable {
    let userHolding: [Holding]
}

struct APIResponse: Codable {
    let data: PortfolioData
}


