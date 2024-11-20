//
//  PortfolioTableViewCell.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell {

    // MARK: - UI Components
    private let symbolLabel = UILabel()
    private let quantityLabel = UILabel()
    private let ltpLabel = UILabel()
    private let pnlLabel = UILabel()
    private let mainStackView = UIStackView()
    private let leftStackView = UIStackView()
    private let rightStackView = UIStackView()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // Configure the main horizontal stack view
        mainStackView.axis = .horizontal
        mainStackView.spacing = 18
        mainStackView.alignment = .center
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure left stack (Symbol and Quantity)
        leftStackView.axis = .vertical
        leftStackView.spacing = 18
        leftStackView.alignment = .leading
        
        // Configure right stack (LTP and P&L)
        rightStackView.axis = .vertical
        rightStackView.spacing = 18
        rightStackView.alignment = .trailing
        
        // Add labels to respective stacks
        leftStackView.addArrangedSubview(symbolLabel)
        leftStackView.addArrangedSubview(quantityLabel)
        
        rightStackView.addArrangedSubview(ltpLabel)
        rightStackView.addArrangedSubview(pnlLabel)
        
        // Add left and right stacks to the main horizontal stack
        mainStackView.addArrangedSubview(leftStackView)
        mainStackView.addArrangedSubview(rightStackView)
        
        // Set constraints for main stack view
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
   // MARK: - Configure Cell
   func configure(with holding: Holding) {
       // Symbol label
       symbolLabel.text = holding.symbol
       symbolLabel.font = UIFont.boldSystemFont(ofSize: 14)

       // Quantity label - Styled "NET QTY: [Quantity]"
       let quantityText = NSMutableAttributedString(string: "NET QTY: ", attributes: [
           .font: UIFont.systemFont(ofSize: 10),
           .foregroundColor: UIColor.gray
       ])
       quantityText.append(NSAttributedString(string: "\(holding.quantity)", attributes: [
           .font: UIFont.systemFont(ofSize: 13),
           .foregroundColor: UIColor.black
       ]))
       quantityLabel.attributedText = quantityText

       // LTP label - Styled with "LTP: ₹[Price]" in bold
       let ltpAttributedString = NSMutableAttributedString(string: "LTP: ", attributes: [
           .font: UIFont.systemFont(ofSize: 10),
           .foregroundColor: UIColor.gray
       ])
       let priceSymbol = "\u{20B9}"
       let ltpPriceAttributedString = NSAttributedString(string: "\(priceSymbol) \(holding.ltp)", attributes: [
           .font: UIFont.systemFont(ofSize: 13),
           .foregroundColor: UIColor.black
       ])
       ltpAttributedString.append(ltpPriceAttributedString)
       ltpLabel.attributedText = ltpAttributedString
       
       // P&L label - Styled with "P&L: ₹[P&L Value]" in bold and color-coded
       let pnlAttributedString = NSMutableAttributedString(string: "P&L: ", attributes: [
           .font: UIFont.systemFont(ofSize: 10),
           .foregroundColor: UIColor.gray
       ])
       let pnlColor = holding.pnl >= 0 ? UIColor.systemGreen : UIColor.systemRed
       let pnlValueAttributedString = NSAttributedString(string: "\(priceSymbol) \(String(format: "%.2f", holding.pnl))", attributes: [
           .font: UIFont.boldSystemFont(ofSize: 13),
           .foregroundColor: pnlColor
       ])
       pnlAttributedString.append(pnlValueAttributedString)
       pnlLabel.attributedText = pnlAttributedString
   }

}





