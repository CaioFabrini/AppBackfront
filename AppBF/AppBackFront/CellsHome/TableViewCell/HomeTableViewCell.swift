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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
