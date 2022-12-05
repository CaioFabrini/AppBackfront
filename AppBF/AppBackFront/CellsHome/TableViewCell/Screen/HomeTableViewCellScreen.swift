//
//  HomeTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 04/12/22.
//

import UIKit

protocol HomeTableViewCellScreenProtocol: AnyObject {
    func goDescriptionScreen()
}

class HomeTableViewCellScreen: UIView {
    
    
    weak private var delegate: HomeTableViewCellScreenProtocol?
    
    func delegate(delegate: HomeTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.tintColor = .purple
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 18
        return image
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.tintColor = .black
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var ownedByLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = ""
        return label
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = ""
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = ""
        return label
    }()
    
    lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.nftImageView)
        self.viewBackgraund.addSubview(self.userImageView)
        self.viewBackgraund.addSubview(self.ownedByLabel)
        self.viewBackgraund.addSubview(self.userLabel)
        self.viewBackgraund.addSubview(self.priceLabel)
        self.viewBackgraund.addSubview(self.priceValueLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 340),
            
            self.nftImageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor),
            self.nftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nftImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.nftImageView.heightAnchor.constraint(equalToConstant: 270),
            
            self.userImageView.topAnchor.constraint(equalTo: self.nftImageView.bottomAnchor, constant: 10),
            self.userImageView.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 8),
            self.userImageView.heightAnchor.constraint(equalToConstant: 48),
            self.userImageView.widthAnchor.constraint(equalToConstant: 48),
            
            self.ownedByLabel.topAnchor.constraint(equalTo: self.nftImageView.bottomAnchor, constant: 20),
            self.ownedByLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 8),
            
            self.userLabel.topAnchor.constraint(equalTo: self.ownedByLabel.bottomAnchor, constant: 5),
            self.userLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 8),
            self.userLabel.widthAnchor.constraint(equalToConstant: 90),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.nftImageView.bottomAnchor, constant: 20),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -15),
            
            self.priceValueLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5),
            self.priceValueLabel.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -15),
            
        ])
    }
}
