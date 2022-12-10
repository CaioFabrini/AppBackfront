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
}

class NftDetailsVC: UIViewController {
    
    var viewModel: NftDetailsViewModel
    var screen: NftDetailsScreen?
    
    override func loadView() {
        self.screen = NftDetailsScreen()
        self.view = screen
    }

    required init(nft: NftList) {
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
        return viewModel.heightForRowAt(indexPath: indexPath)
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
            
            return cell ?? UITableViewCell()
        case .descripition:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for:  indexPath) as? DescriptionTableViewCell
           
            
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        
        }
    }
 
}
