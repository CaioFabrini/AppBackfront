//
//  UserDataTableViewCell.swift
//  ProfileScreen
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

enum UserDataTableViewCellString: String {
    case identifier = "UserDataTableViewCell"
}

class UserDataTableViewCell: UITableViewCell {
    
    static let identifier: String = UserDataTableViewCellString.identifier.rawValue
    var screen: UserDataTableViewCellScreen = UserDataTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        screen.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(screen)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

