//
//  ListOfOffersTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 17/12/22.
//

import UIKit

class ListOfOffersTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.tintColor = .lightGray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = ""
        return label
    }()
    
    lazy var nftPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = ""
        return label
    }()
    
    lazy var lastVizualizationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addSbView()
        setupConstraints()
    }
    
    private func addSbView() {
        self.addSubview(self.userImageView)
        self.addSubview(self.nameUserLabel)
        self.addSubview(self.nftPriceLabel)
        self.addSubview(self.lastVizualizationLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.userImageView.heightAnchor.constraint(equalToConstant: 40),
            self.userImageView.widthAnchor.constraint(equalToConstant: 40),
            
            self.nameUserLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameUserLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 12),
            
            self.nftPriceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nftPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.lastVizualizationLabel.topAnchor.constraint(equalTo: self.nftPriceLabel.bottomAnchor, constant: 5),
            self.lastVizualizationLabel.trailingAnchor.constraint(equalTo: self.nftPriceLabel.trailingAnchor),
            
            
        ])
    }
    
    
}
