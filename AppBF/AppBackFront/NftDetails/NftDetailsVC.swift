//
//  NftDetailsVC.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit

enum NameCell: Int {
    case nftImage = 0
    case descripition = 1
    case latestDeals = 2
}

class NftDetailsVC: UIViewController {
    
    var viewModel: NftDetailsViewModel
    var screen: NftDetailsScreen?
    
    override func loadView() {
        self.screen = NftDetailsScreen()
        self.view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailsViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
}
extension NftDetailsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath, widht: view.frame.width)
    }
    
}

extension NftDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCell(rawValue: indexPath.row) {
        case .nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageCell.identifier, for: indexPath) as? NftImageCell
            cell?.setupCell(data: viewModel.getNFTImage)
            cell?.delegate(delegate: self)
            return cell ?? UITableViewCell()
        case .descripition:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for:  indexPath) as? DescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNFT, title: viewModel.titleLabel, description: viewModel.descriptionLabel)
            
            return cell ?? UITableViewCell()
        case .latestDeals:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell
            cell?.setupCell(data: viewModel.getNft)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
            
        }
    }
}

extension NftDetailsVC: NftImageCellProtocol {
    func actionClosedButton() {
        print(#function)
        dismiss(animated: true)
    }
    
    func actionMagnifyingGlassButton() {
        print(#function)
        let vc = MagnifyingGlassVC(url: viewModel.getNFTImage)
        self.present(vc, animated: true)
    }
}
