//
//  HomeTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 04/12/22.
//

import UIKit

enum HomeTableViewCellString: String {
    case identifier = "HomeTableViewCell"
}

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = HomeTableViewCellString.identifier.rawValue
    
    weak private var delegate: HomeTableViewCellScreenProtocol?
    
    func delegate(delegate: HomeTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubView()
        setUpConstraintsScreenCell()
    }
    
    func addSubView() {
        self.contentView.addSubview(self.screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    public func setupHomeCell(data: NFTTest) {
        self.screen.nftImageView.image = UIImage(systemName: data.imageNFT)
        self.screen.userImageView.image = UIImage(systemName: data.imageUser)
        self.screen.priceValueLabel.text = data.priceValue
        self.screen.ownedByLabel.text = data.ownedBy
        self.screen.userLabel.text = data.nameUser
        self.screen.priceLabel.text = data.price
        
    }
}
