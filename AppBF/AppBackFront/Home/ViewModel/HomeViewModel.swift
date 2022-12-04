//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

protocol HomeViewModelDelegate:AnyObject {
    func success()
    func error(_message: String)
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
   

    public func fetch() {
        
        self.service.getHome { success, error in
            if let success = success {
                self.nftData = success
                self.delegate?.success()
            } else {
                self.delegate?.error(_message: error?.localizedDescription ?? "")
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return 10
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
}
