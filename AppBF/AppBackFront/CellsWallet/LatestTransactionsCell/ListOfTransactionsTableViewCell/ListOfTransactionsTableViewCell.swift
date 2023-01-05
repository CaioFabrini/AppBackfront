//
//  ListOfTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

enum ListOfTransactionsTableViewCellString: String {
    case identifier = "ListOfTransactionsTableViewCell"
}

class ListOfTransactionsTableViewCell: UITableViewCell {
    
    static let identifier = ListOfTransactionsTableViewCellString.identifier.rawValue
    
    lazy var screen: ListOfTransactionsTableViewCellScreen = {
        let view = ListOfTransactionsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
    }
    
    public func setupCell(data: ListOfTransaction, isInicial: Bool, isFinal: Bool) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "us_US")
        formatter.maximumFractionDigits = 2
        
        self.screen.idTransactionLabel.text = data.idTransaction
        self.screen.transactionImageView.image = UIImage(named: data.image ?? "")
        self.screen.priceEthLabel.text = "\(data.priceEth ?? 0.0) ETH"
        self.screen.valueInDollarLabel.text = formatter.string(from: (data.valueDollar ?? 0.0) as NSNumber) ?? ""
        self.screen.dateAndHourLabel.text = data.dateAndHour
        
        self.screen.layer.borderColor = UIColor.white.cgColor
        self.screen.layer.borderWidth = 0.5
        
        if isInicial {
            self.screen.roundCorners(cornerRadiuns: 20.0, typeCorners: [.topRight, .topLeft])
        }
        
        if isFinal {
            self.screen.roundCorners(cornerRadiuns: 20.0, typeCorners: [.bottomRight, .bottomLeft])
        }
        
        
        if data.type == "exit" {
            screen.priceEthLabel.text = "-\(data.priceEth ?? 0.0) ETH"
            screen.priceEthLabel.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
            screen.valueInDollarLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
            screen.dateAndHourLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
            
        } else if data.type == "entry" {
            screen.priceEthLabel.text = "+\(data.priceEth ?? 0.0) ETH"
            screen.priceEthLabel.textColor = UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
            screen.valueInDollarLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
            screen.dateAndHourLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        }
                     
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.screen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
