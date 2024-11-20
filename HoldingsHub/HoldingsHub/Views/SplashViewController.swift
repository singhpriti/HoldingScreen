//
//  SplashViewController.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .purple
        navigateToPortfolioScreen()
    }
    
    private func navigateToPortfolioScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let portfolioVC = PortfolioViewController()
            portfolioVC.modalPresentationStyle = .fullScreen
            self.present(portfolioVC, animated: true, completion: nil)
        }
    }
}
