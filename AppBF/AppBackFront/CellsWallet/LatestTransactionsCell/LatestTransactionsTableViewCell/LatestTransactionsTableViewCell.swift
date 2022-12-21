//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit
enum HeightLLatestTransactions: CGFloat {
    case height = 70
}

enum LatestTransactionsTableViewCellString: String {
    case identifier = "LatestTransactionsTableViewCell"
}

class LatestTransactionsTableViewCell: UITableViewCell {
    
    static let identifier: String = LatestTransactionsTableViewCellString.identifier.rawValue
    var latestTransactions: [ListOfTransaction] = []
    
    lazy var screen: LatestTransactionsTableViewCellScreen = {
        let view = LatestTransactionsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
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
    
    func validateIncial(indexPath: IndexPath) -> Bool {
        
        if indexPath.row == 0 {
            return true
        } else {
            return false
        }
    }
    
    func validateFinal(indexPath: IndexPath) -> Bool {
        
        if indexPath.row == latestTransactions.count - 1 {
            return true
        } else {
            return false
        }
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate {
}

extension LatestTransactionsTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionsTableViewCell.identifier, for: indexPath) as? ListOfTransactionsTableViewCell
        cell?.setupCell(data: latestTransactions[indexPath.row], isInicial: validateIncial(indexPath: indexPath), isFinal: validateFinal(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HeightLLatestTransactions.height.rawValue
    }
    
}

