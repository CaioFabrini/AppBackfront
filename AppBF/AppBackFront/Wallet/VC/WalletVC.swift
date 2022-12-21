//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

enum WalletNameCell: Int {
    
    case quotationEth = 0
    case transactionList = 1
}

class WalletVC: UIViewController {
    
    var walletScreen: WalletScreen?
    let viewModel: WalletViewModel = WalletViewModel()
    
    
    override func loadView() {
        self.walletScreen = WalletScreen()
        self.view = walletScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signatureDelegate()
        self.viewModel.fetch(.mock)
    }
    
    private func signatureDelegate() {
        viewModel.delegate(delegate: self)
    }

}

extension WalletVC: WalletViewModelDelegate {
    func success() {
        print(#function)
        DispatchQueue.main.async {
            self.walletScreen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.walletScreen?.tableView.reloadData()
        }
    }
    
    func error(_message: String) {

        print(#function)
    }
}

extension WalletVC: UITableViewDelegate {
}

extension WalletVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell
            cell?.setupCell(data: viewModel.quotationEthCell)
            return cell ?? UITableViewCell()
        case .transactionList:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestTransactionsTableViewCell.identifier, for: indexPath) as? LatestTransactionsTableViewCell
            cell?.setupCell(data: viewModel.transactionList)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
}
