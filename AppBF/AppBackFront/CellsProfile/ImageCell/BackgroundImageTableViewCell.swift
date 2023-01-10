//
//  BackgroundImageTableViewCell.swift
//  ProfileScreen
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

enum BackgroundImageTableViewCellString: String {
    case identifier = "BackgroundImageTableViewCell"
}

class BackgroundImageTableViewCell: UITableViewCell {
    
    var screen: BackgroundImageTableViewCellScreen = BackgroundImageTableViewCellScreen()
    
    static let identifier: String = BackgroundImageTableViewCellString.identifier.rawValue
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

