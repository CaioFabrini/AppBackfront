//
//  QuotationETHScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

class QuotationEthTableViewCellScreen: UIView {
    
    lazy var logoBFImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "vector")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 70/255, green: 50/255, blue: 50/255, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor(red: 131/255, green: 127/255, blue: 131/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var ethValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = ""
        return label
    }()
    
    lazy var ethValueInDollarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = ""
        return label
    }()
    lazy var coinEthImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
//        image.backgroundColor = .white
        return image
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        self.addSubview(self.logoBFImageView)
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.ethValueLabel)
        self.viewBackgraund.addSubview(self.ethValueInDollarsLabel)
        self.viewBackgraund.addSubview(self.coinEthImageView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.logoBFImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.logoBFImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.logoBFImageView.heightAnchor.constraint(equalToConstant: 40),
            self.logoBFImageView.widthAnchor.constraint(equalToConstant: 40),
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.logoBFImageView.bottomAnchor, constant: 20),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.logoBFImageView.leadingAnchor),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 150),
            
            self.ethValueLabel.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor, constant: 40),
            self.ethValueLabel.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 15),
            
            self.ethValueInDollarsLabel.topAnchor.constraint(equalTo: self.ethValueLabel.bottomAnchor, constant: 10),
            self.ethValueInDollarsLabel.leadingAnchor.constraint(equalTo: self.ethValueLabel.leadingAnchor),
            
            self.coinEthImageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor, constant: 5),
            self.coinEthImageView.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -10),
            self.coinEthImageView.bottomAnchor.constraint(equalTo: self.viewBackgraund.bottomAnchor, constant: -5),
            self.coinEthImageView.widthAnchor.constraint(equalToConstant: 150),
    
        ])
    }
    
}
