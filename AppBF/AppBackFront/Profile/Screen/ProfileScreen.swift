//
//  ProfileScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

class ProfileScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        tableView.isScrollEnabled = false
        tableView.register(BackgroundImageTableViewCell.self, forCellReuseIdentifier: BackgroundImageTableViewCell.identifier)
        tableView.register(UserDataTableViewCell.self, forCellReuseIdentifier: UserDataTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        addSubView()
        setUpConstraints()
    }
    
    private func addSubView() {
        self.addSubview(tableView)
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
