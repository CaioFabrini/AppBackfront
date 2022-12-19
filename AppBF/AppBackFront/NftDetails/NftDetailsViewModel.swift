//
//  NftDetailsViewModel.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit



class NftDetailsViewModel {
    
    private var nft: NftList
    
    init(nft: NftList) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var getNFTImage: String {
        return nft.ntfImage ?? ""
    }
    
    public var idNFT: Int {
        return nft.nftID ?? 0
    }
    
    public var titleLabel: String {
        return nft.titleLatestDeals ?? ""
    }
    
    public var descriptionLabel: String{
        return nft.nftDescription ?? ""
    }
    
//    latestDeals -> criar var depois
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        
        switch NameCell(rawValue: indexPath.row){
        case .nftImage:
            return 400
        case .descripition:
            return 130
        case .latestDeals:
            //    valor da altura da celula vezes latestDeals.count
            return 500
        default:
            return 0
            
        }
    }
}
