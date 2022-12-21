//
//  QuotationEthTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

enum QuotationEthTableViewCellString: String {
    case identifier = "QuotationEthTableViewCell"
}

class QuotationEthTableViewCell: UITableViewCell {
    
    static let identifier: String = QuotationEthTableViewCellString.identifier.rawValue
    
    lazy var screen: QuotationEthTableViewCellScreen = {
        let view = QuotationEthTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        self.contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: QuotationEthereum) {
        screen.logoBFImageView.image = UIImage(named: "vector")
        screen.ethValueLabel.text = "\(data.ethValue ?? 0.0) ETH"
        screen.ethValueInDollarsLabel.text = "$ \(data.valueInDollars ?? 0.0 )"
        screen.coinEthImageView.image = UIImage(named: data.coinEthImage ?? "" )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}
