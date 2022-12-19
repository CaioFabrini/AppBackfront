//
//  LatestDealTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 17/12/22.
//

import UIKit

class LatestDealTableViewCell: UITableViewCell {
    
    static let identifier: String = "LatestDealTableViewCell"
    var latestDealsScreen: LatestDealsScreen = LatestDealsScreen()
    
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
    
}
extension LatestDealTableViewCell: UITableViewDelegate {
}
extension LatestDealTableViewCell: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ListOfOffersTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListOfOffersTableViewCell.identifier, for: indexPath) as? ListOfOffersTableViewCell
        
        return cell ?? UITableViewCell()
        
    }
    
}
