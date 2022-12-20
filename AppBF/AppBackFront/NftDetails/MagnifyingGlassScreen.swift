//
//  MagnifyingGlassScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 17/12/22.
//

import UIKit

class MagnifyingGlassScreen: UIView {

    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(nftImageView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.nftImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.nftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nftImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.nftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
  
        ])
    }
    
    
}
