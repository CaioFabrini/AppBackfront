//
//  ListOfTransactionsTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

class ListOfTransactionsTableViewCellScreen: UIView {
    
    lazy var idTransactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = ""
        return label
    }()
    
    lazy var transactionImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var priceEthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = ""
        return label
        
    }()
    
    lazy var valueInDollarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = ""
        return label
    }()
    
    lazy var dateAndHourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = ""
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        self.addSubview(idTransactionLabel)
        self.addSubview(transactionImageView)
        self.addSubview(priceEthLabel)
        self.addSubview(valueInDollarLabel)
        self.addSubview(dateAndHourLabel)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            transactionImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            transactionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            transactionImageView.heightAnchor.constraint(equalToConstant: 20),
            transactionImageView.widthAnchor.constraint(equalToConstant: 20),
            
            idTransactionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            idTransactionLabel.leadingAnchor.constraint(equalTo: self.transactionImageView.trailingAnchor, constant: 10),
            
            dateAndHourLabel.topAnchor.constraint(equalTo: self.idTransactionLabel.bottomAnchor, constant: 5),
            dateAndHourLabel.leadingAnchor.constraint(equalTo: self.idTransactionLabel.leadingAnchor),
            
            priceEthLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            priceEthLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            valueInDollarLabel.topAnchor.constraint(equalTo: self.priceEthLabel.bottomAnchor, constant: 5),
            valueInDollarLabel.trailingAnchor.constraint(equalTo: self.priceEthLabel.trailingAnchor),
            
        ])
    }
}
