//
//  NftImageCellScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit

class NftImageCellScreen: UIView {
    
    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    lazy var lupaImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fechar")
        return image
    }()
    
    lazy var fecharImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "lupa")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nftImageView)
        self.nftImageView.addSubview(fecharImageView)
        self.nftImageView.addSubview(lupaImageView)
        self.configContrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContrainsts(){
        NSLayoutConstraint.activate([
            
            nftImageView.topAnchor.constraint(equalTo: self.topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            fecharImageView.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            fecharImageView.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            fecharImageView.heightAnchor.constraint(equalToConstant: 20),
            fecharImageView.widthAnchor.constraint(equalToConstant: 20),

            
            
            lupaImageView.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            lupaImageView.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            lupaImageView.heightAnchor.constraint(equalToConstant: 20),
            lupaImageView.widthAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
}
