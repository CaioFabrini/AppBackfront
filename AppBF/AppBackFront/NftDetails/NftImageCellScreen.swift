//
//  NftImageCellScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit

protocol ButtonsScreenProtocol: AnyObject {
    func actionXButton()
    func actionLupaButton()
}

class NftImageCellScreen: UIView {
    
    private weak var delegate: ButtonsScreenProtocol?
    
    func delegate(delegate: ButtonsScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var xButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedXButton), for: .touchUpInside)
        button.setImage(UIImage(named: "fechar"), for: .normal)
        return button
    }()
    
    lazy var lupaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.actionLupaButton), for: .touchUpInside)
        button.setImage(UIImage(named: "lupa"), for: .normal)

        return button
    }()

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
        addSubview(xButton)
        addSubview(lupaButton)
        self.configContrainsts()
    }
    
    @objc private func tappedXButton() {
        self.delegate?.actionXButton()
    }
    
    @objc private func actionLupaButton() {
        self.delegate?.actionLupaButton()
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
            
            xButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            xButton.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            xButton.heightAnchor.constraint(equalToConstant: 20),
            xButton.widthAnchor.constraint(equalToConstant: 20),
                        
            lupaButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            lupaButton.trailingAnchor.constraint(equalTo: self.nftImageView.trailingAnchor, constant: -20),
            lupaButton.heightAnchor.constraint(equalToConstant: 20),
            lupaButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
