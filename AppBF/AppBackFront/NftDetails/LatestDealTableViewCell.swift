//
//  LatestDealTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 17/12/22.
//

import UIKit

enum HeightLatestDealNft: CGFloat {
    case height = 90
}

class LatestDealTableViewCell: UITableViewCell {
    
    static let identifier: String = "LatestDealTableViewCell"
    var latestDealsScreen: LatestDealsScreen = LatestDealsScreen()
    var dataLatestDeal: [LatestDeal] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
        latestDealsScreen.configProtocolsTableView(delegate: self, dataSource: self)
    }
    
    private func addSubView() {
        self.latestDealsScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.latestDealsScreen)
    }
    
    public func setupCell(data: Nft) {
        self.latestDealsScreen.titleLabel.text = data.titleLatestDeals ?? ""
        self.dataLatestDeal = data.latestDeals ?? []
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.latestDealsScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.latestDealsScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.latestDealsScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.latestDealsScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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
        if indexPath.row == dataLatestDeal.count - 1 {
            return true
        } else {
            return false
        }
    }
    
}

extension LatestDealTableViewCell: UITableViewDelegate {
    
}

extension LatestDealTableViewCell: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataLatestDeal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ListOfOffersTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListOfOffersTableViewCell.identifier, for: indexPath) as? ListOfOffersTableViewCell
        cell?.setupCell(data: dataLatestDeal[indexPath.row], isInicial: validateIncial(indexPath: indexPath), isFinal: validateFinal(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HeightLatestDealNft.height.rawValue
    }
    
}
