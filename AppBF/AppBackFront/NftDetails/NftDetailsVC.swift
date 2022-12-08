//
//  NftDetailsVC.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit

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
        view.backgroundColor = .red
    }

}
extension NftDetailsVC: UITableViewDelegate { }

extension NftDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
    
    
}
