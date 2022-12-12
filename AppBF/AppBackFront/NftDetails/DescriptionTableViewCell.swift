//
//  DescriptionTableViewCell.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 10/12/22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let identifier: String = "DescriptionTableViewCell"
    
    lazy var screen: DescriptionCellScreen = {
        let view = DescriptionCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(screen)
        self.configContrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(id: Int, title: String, description: String) {
        self.screen.idLabel.text = String ("#\(id)")
        self.screen.titleLabel.text = title
        self.screen.descriptionLabel.text = description
    }

    private func configContrainsts(){
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
