//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

protocol HomeViewModelDelegate:AnyObject {
    func success()
    func error(_message: String)
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTHomeData?
    
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }

    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { sucess, error in
                if let sucess = sucess {
                    self.nftData = sucess
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case.request:
            self.service.getHome { success, error in
                if let success = success {
                    self.nftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return nftData?.nftList?.count ?? 0
    }
    
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func loadCurrentNFT(indexPath: IndexPath) -> NftList {
        return nftData?.nftList?[indexPath.row] ?? NftList()
    }
    
    
}
