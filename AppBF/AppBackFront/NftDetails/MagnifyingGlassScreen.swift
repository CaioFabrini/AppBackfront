//
//  MagnifyingGlassScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 17/12/22.
//

import UIKit

protocol MagnifyingGlassScreenProtocol: AnyObject {
    func tappedReturn()
}

class MagnifyingGlassScreen: UIView {
    
    private weak var delegate: MagnifyingGlassScreenProtocol?
    
    func delegate(delegate: MagnifyingGlassScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    lazy var returnButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.actionReturn), for: .touchUpInside)
        return button
    }()
    
    @objc private func actionReturn(){
        self.delegate?.tappedReturn()
        print(#function)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(nftImageView)
        self.addSubview(returnButton)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: self.topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            returnButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 20),
            returnButton.leadingAnchor.constraint(equalTo: self.nftImageView.leadingAnchor, constant: 20),
            returnButton.heightAnchor.constraint(equalToConstant: 30),
            returnButton.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}
