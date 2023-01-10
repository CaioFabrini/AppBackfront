//
//  UserDataTableViewCellScreen.swift
//  ProfileScreen
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

enum UserDataTableViewCellScreenString: String {
    
    case userImage = "user01"
    case editImage = "pencil"
    case exitAppButton = "Sair do App"
    case nameUser = "Mason Yates"
    case userAt = "@mason_yates"
}

class UserDataTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: UserDataTableViewCellScreenString.userImage.rawValue)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 65
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor(red: 255/255, green: 205/255, blue: 252/255, alpha: 1).cgColor
        return image
    }()
    
    lazy var editImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: UserDataTableViewCellScreenString.editImage.rawValue)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var exitAppButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(UserDataTableViewCellScreenString.exitAppButton.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1).cgColor
        button.layer.borderWidth = 1.7
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = UserDataTableViewCellScreenString.nameUser.rawValue
        return label
    }()
    
    lazy var userAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = UserDataTableViewCellScreenString.userAt.rawValue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        self.addSubview(userImageView)
        self.addSubview(editImageView)
        self.addSubview(exitAppButton)
        self.addSubview(nameLabel)
        self.addSubview(userAtLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            userImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            userImageView.widthAnchor.constraint(equalToConstant: 130),
            
            editImageView.bottomAnchor.constraint(equalTo: self.userImageView.bottomAnchor),
            editImageView.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: -25),
            editImageView.heightAnchor.constraint(equalToConstant: 25),
            editImageView.widthAnchor.constraint(equalToConstant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            userAtLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            userAtLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            exitAppButton.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: 60),
            exitAppButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            exitAppButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            exitAppButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

