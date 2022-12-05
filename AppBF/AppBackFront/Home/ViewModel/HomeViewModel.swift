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
    private var nftData: [NFT]?
    
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }

    public func fetch() {
        self.service.getHome { success, error in
            if let success = success {
                self.nftData = (success.results ?? []).filter({$0.cachedImages != nil})
                self.delegate?.success()
            } else {
                self.delegate?.error(_message: error?.localizedDescription ?? "")
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return nftData?.count ?? 0
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
//    
//    var nftTest: [NFTTest] = [NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
//                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
//                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
//                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:")]
//    
//    var filterTest: [FilterName] = [FilterName(filter: "Todos"),
//                                    FilterName(filter: "3D"),
//                                    FilterName(filter: "Ilustração"),
//                                    FilterName(filter: "Fotos"),
//                                    FilterName(filter: "GIFs")]
    
    func loadCurrentNFT(indexPath: IndexPath) -> NFT {
        return nftData?[indexPath.row] ?? NFT()
    }
    
    
}
