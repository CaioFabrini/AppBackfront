//
//  HomeCollectionViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 05/12/22.
//

import UIKit


class HomeCollectionViewCellScreen: UIView {
    
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        label.text = ""
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setUpConstraintsScreenCell()
    }
    
    private func addSubView() {
        self.addSubview(self.filterLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            
            self.filterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.filterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.filterLabel.heightAnchor.constraint(equalToConstant: 34),
            self.filterLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
