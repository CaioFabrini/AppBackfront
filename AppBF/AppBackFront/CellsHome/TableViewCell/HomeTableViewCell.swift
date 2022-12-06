//
//  HomeTableViewCell.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 04/12/22.
//
import Foundation
import UIKit
import AlamofireImage

enum HomeTableViewCellString: String {
    case identifier = "HomeTableViewCell"
}

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = HomeTableViewCellString.identifier.rawValue
    
    weak private var delegate: HomeTableViewCellScreenProtocol?
    
    func delegate(delegate: HomeTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
    
    var nameImage: [String] = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10"]
    var nameUser: [String] = ["Seabu", "Syas", "Urwuo", "Zayn", "Tiaduleu", "Bamoe", "Caels", "Lyur", "Diaen", "Hayxu"]
    var priceValue: [Int] = []

    func randomPriceValue() {
        for _ in 1...10{
            let random = Int.random(in: 0...50)
            priceValue.append(random)
            
        }
    }


    public func setupHomeCell(data: NFT) {
        guard let url = URL(string: data.cachedImages?.tiny100_100 ?? "") else { return }
        self.screen.nftImageView.af.setImage(withURL: url)
        self.screen.userImageView.image = UIImage(named:  nameImage.randomElement() ?? "")
        self.screen.priceValueLabel.text = " \(priceValue.randomElement() ?? 0) ETH"
        self.screen.ownedByLabel.text = "Propriedade de:"
        self.screen.userLabel.text = nameUser.randomElement() ?? ""
        self.screen.priceLabel.text = "Preço"
    }
}
