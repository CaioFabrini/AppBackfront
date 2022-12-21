//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

enum LatestTransactionsTableViewCellString: String {
    case identifier = "LatestTransactionsTableViewCell"
}

class LatestTransactionsTableViewCell: UITableViewCell {
    
    static let identifier: String = LatestTransactionsTableViewCellString.identifier.rawValue
    var screen: LatestTransactionsTableViewCellScreen = LatestTransactionsTableViewCellScreen()
    var latestTransactions: [ListOfTransaction] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
        selectionStyle = .none
        screen.configProtocolsTableView(delegate: self, dataSource: self)
    }
    
    private func addSubView() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
    }
    
    public func setupCell(data: LatestTransactionsCell) {
        self.screen.titleLabel.text = data.latestTransactionsTitle ?? ""
        self.latestTransactions = data.listOfTransactions ?? []
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.screen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate {
}

extension LatestTransactionsTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}

