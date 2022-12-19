//
//  DescriptionCellScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 09/12/22.
//

import UIKit

class DescriptionCellScreen: UIView {

    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 240/255, green: 156/255, blue: 248/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = ""
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = ""
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(idLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        self.configContrainsts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContrainsts(){
        NSLayoutConstraint.activate([
            
            self.idLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            self.idLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.idLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.idLabel.bottomAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.idLabel.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.idLabel.trailingAnchor),
//
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.idLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.idLabel.trailingAnchor)
//
        ])
    }
    
}
