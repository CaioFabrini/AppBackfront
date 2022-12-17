//
//  HomeCollectionViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 05/12/22.
//

import UIKit

enum HomeCollectionViewCellString: String {
    case identifier = "HomeCollectionViewCell"
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = HomeCollectionViewCellString.identifier.rawValue
    
    lazy var screen: HomeCollectionViewCellScreen = {
        let view = HomeCollectionViewCellScreen()
//        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setUpConstraintsScreenCell()
    }
    
    func addSubView() {
        self.contentView.addSubview(self.screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    public func setupCollectionCell(data: FilterNft) {
        self.screen.filterLabel.text = data.title
        if data.isSelected ?? false {
            screen.filterLabel.backgroundColor = .purple
        } else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
    }
}
