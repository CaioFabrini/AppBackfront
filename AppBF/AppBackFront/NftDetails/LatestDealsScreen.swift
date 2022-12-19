//
//  LatestDealsScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 10/12/22.
//

import UIKit

class LatestDealsScreen: UIView {
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .black)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "teste"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        // desabilitar scroll
        tableView.register(ListOfOffersTableViewCell.self, forCellReuseIdentifier: ListOfOffersTableViewCell.identifier)
        return tableView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame )
        backgroundColor = UIColor(red: 0.2, green: 0.2, blue:0.2, alpha: 1)
        configSubView()
        configConstraints()
    }
    
    func configSubView() {
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
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
            
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        
        ])
    }
}
