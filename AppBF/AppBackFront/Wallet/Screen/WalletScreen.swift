//
//  WalletScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

class WalletScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(QuotationEthTableViewCell.self, forCellReuseIdentifier: QuotationEthTableViewCell.identifier)
        tableView.register(LatestTransactionsTableViewCell.self, forCellReuseIdentifier: LatestTransactionsTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        addSubView()
        setupConstraints()
    }
    
    
    private func addSubView() {
        self.addSubview(tableView)
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}
