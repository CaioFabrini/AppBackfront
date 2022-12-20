//
//  ListOfOffersTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 17/12/22.
//

import UIKit
import AlamofireImage

enum ListOfOffersTableViewCellString: String {
    case identifier = "ListOfOffersTableViewCell"
}

class ListOfOffersTableViewCell: UITableViewCell {
    
    static let identifier: String = ListOfOffersTableViewCellString.identifier.rawValue
    var listOfOffersTableViewCell: ListOfOffersTableViewCellScreen = ListOfOffersTableViewCellScreen()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
    }
    
    public func setupCell(data: LatestDeal, isInicial: Bool, isFinal: Bool) {
        guard let urlUser = URL(string: data.userImage ?? "") else { return }
        listOfOffersTableViewCell.layer.borderColor = UIColor.white.cgColor
        listOfOffersTableViewCell.layer.borderWidth = 0.5
        
        self.listOfOffersTableViewCell.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
        self.listOfOffersTableViewCell.nameUserLabel.text = data.userName
        self.listOfOffersTableViewCell.nftPriceLabel.text = String(data.nftPrice ?? 0.0)
        self.listOfOffersTableViewCell.lastVizualizationLabel.text = data.lastAccess
        
        if isInicial {
            // arredondar bordas superiores
        }
        
        if isFinal {
            // arredondar bordas inferiores
        }
    }
    
    private func addSubView() {
        self.listOfOffersTableViewCell.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.listOfOffersTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.listOfOffersTableViewCell.topAnchor.constraint(equalTo: self.topAnchor),
            self.listOfOffersTableViewCell.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.listOfOffersTableViewCell.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.listOfOffersTableViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
