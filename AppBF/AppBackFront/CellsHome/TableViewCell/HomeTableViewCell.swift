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
    var data: [NFTData] = []
    
    weak private var delegate: HomeTableViewCellScreenProtocol?
    
    func delegate(delegate: HomeTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    criar setup da celula
    public func setupHomeCell(data: NFTTest) {
        self.screen.nftImageView.image = UIImage(named: data.imageNFT)
        self.screen.userImageView.image = UIImage(named: data.imageUser)
        self.screen.priceValueLabel.text = data.priceValue
        self.screen.ownedByLabel.text = data.ownedBy
        self.screen.userLabel.text = data.nameUser
        
    }
    
}
