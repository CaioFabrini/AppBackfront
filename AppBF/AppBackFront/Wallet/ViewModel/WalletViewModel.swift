//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import UIKit

protocol  WalletViewModelDelegate: AnyObject {
    func success()
    func error(_message: String)
}

class WalletViewModel {
    
    private let service: WalletService = WalletService()
    private var getNftData: WalletData?
    
    private weak var delegate: WalletViewModelDelegate?
    
    public func delegate(delegate: WalletViewModelDelegate?) {
        self.delegate = delegate
    }

    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getHomefromJson { success, error in
                if let success = success {
                    self.getNftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getHome { success, error in
                if let success = success {
                    self.getNftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return 1 
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        switch WalletNameCell(rawValue: indexPath.row){
        case .quotationEth:
            return 200
        default:
            return 0
        }
    }

}
