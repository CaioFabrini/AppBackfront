//
//  BackgroundImageTableViewCellScreen.swift
//  ProfileScreen
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

enum BackgroundImageTableViewCellScreenString: String {
    case nameImage = "nft5"
}

class BackgroundImageTableViewCellScreen: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: BackgroundImageTableViewCellScreenString.nameImage.rawValue )
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        self.addSubview(backgroundImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

