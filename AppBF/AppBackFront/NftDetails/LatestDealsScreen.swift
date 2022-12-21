//
//  LatestDealsScreen.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 10/12/22.
//

import UIKit

enum Text: String {
    case title = "teste"
}

class LatestDealsScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.text = Text.title.rawValue
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(ListOfOffersTableViewCell.self, forCellReuseIdentifier: ListOfOffersTableViewCell.identifier)
        return tableView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame )
        self.addSubView()
        self.configConstraints()
    }
    
    private func addSubView() {
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
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
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
            tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        
        ])
    }
}
