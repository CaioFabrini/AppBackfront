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
        self.screen.idTransactionLabel.text = data.idTransaction
        self.screen.transactionImageView.image = UIImage(named: data.image ?? "")
        self.screen.priceEthLabel.text = "\(data.priceEth ?? 0.0)ETH"
        self.screen.valueInDollarLabel.text = "$\(data.valueDollar ?? 0.0)"
        self.screen.dateAndHourLabel.text = data.dateAndHour
        
        self.screen.layer.borderColor = UIColor.white.cgColor
        self.screen.layer.borderWidth = 0.5
        
        if isInicial {
            self.screen.roundCorners(cornerRadiuns: 20.0, typeCorners: [.topRight, .topLeft])
        }
        
        if isFinal {
            self.screen.roundCorners(cornerRadiuns: 20.0, typeCorners: [.bottomRight, .bottomLeft])
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
