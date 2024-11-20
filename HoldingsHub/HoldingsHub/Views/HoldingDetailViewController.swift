//
//  HoldingDetailViewController.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import UIKit

class HoldingDetailViewController: UIViewController {
    private let holding: Holding
    
    init(holding: Holding) {
        self.holding = holding
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
        Symbol: \(holding.symbol)
        Quantity: \(holding.quantity)
        LTP: \(holding.ltp)
        Avg Price: \(holding.avgPrice)
        Close Price: \(holding.close)
        """
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }

}


