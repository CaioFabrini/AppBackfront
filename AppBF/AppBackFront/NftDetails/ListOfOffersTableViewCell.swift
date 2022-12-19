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
    var listOfOffersTableViewCell: ListOfOffersTableViewCell = ListOfOffersTableViewCell()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
    }
    
    public func setupCell(data: LatestDeal) {
        
        
        
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
