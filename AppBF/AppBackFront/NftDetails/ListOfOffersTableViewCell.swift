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
    
    public func setupCell() {
//        guard let urlUser = URL(string: data.userImage ?? "") else { return }
//        self.listOfOffersTableViewCell.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
//        self.listOfOffersTableViewCell.nameUserLabel.text = data.userName
//        self.listOfOffersTableViewCell.nftPriceLabel.text = String(data.nftPrice ?? 0.0)
//        self.listOfOffersTableViewCell.lastVizualizationLabel.text = data.lastAccess
                
        self.listOfOffersTableViewCell.userImageView.image = UIImage(systemName: "person.circle.fill")
                self.listOfOffersTableViewCell.nameUserLabel.text = "Barbara"
                self.listOfOffersTableViewCell.nftPriceLabel.text = "1.2 HT"
                self.listOfOffersTableViewCell.lastVizualizationLabel.text = "2h atras"
        
   
        
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
