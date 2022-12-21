//
//  LatestTransactionsTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

class LatestTransactionsTableViewCellScreen: UIView {
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
//        tableView.register(   .self, forCellReuseIdentifier: .identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
    }
    
    public func configProtocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        
        ])
    }
    
}
