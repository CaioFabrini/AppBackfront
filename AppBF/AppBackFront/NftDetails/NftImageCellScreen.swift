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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nftImageView)
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
            nftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}
