//
//  NftImageCellScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit

enum ButtonString: String {
    case closedButton = "xmark"
    case magnifyingGlass = "magnifyingglass"
}

protocol NftImageCellScreenProtocol: AnyObject {
    func tappedClosed()
    func actionMagnifyingGlassButton()
}

class NftImageCellScreen: UIView {
    
    private weak var delegate: NftImageCellScreenProtocol?
    
    func delegate(delegate: NftImageCellScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor (red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.tappedClosedButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: ButtonString.closedButton.rawValue), for: .normal)
        return button
    }()
    
    lazy var magnifyingGlassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor (red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.actionMagnifyingGlassButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: ButtonString.magnifyingGlass.rawValue), for: .normal)
        
        return button
    }()
    
    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.tintColor = .white
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nftImageView)
        addSubview(closedButton)
        addSubview(magnifyingGlassButton)
        self.configContrainsts()
        
    }
    
    @objc private func tappedClosedButton() {
        self.delegate?.tappedClosed()
    }
    
    @objc private func actionMagnifyingGlassButton() {
        self.delegate?.actionMagnifyingGlassButton()
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
            
            closedButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closedButton.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 35),
            closedButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
