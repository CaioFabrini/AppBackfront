//
//  NftDetailsViewModel.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 08/12/22.
//

import UIKit



class NftDetailsViewModel {
    
    private var nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var getNFTImage: String {
        return nft.nftImage ?? ""
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
    
    public var getNft: Nft {
        return nft
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        
        switch NameCell(rawValue: indexPath.row){
        case .nftImage:
            return 400
        case .descripition:
            return 130
        case .latestDeals:
            return HeightLatestDealNft.height.rawValue * CGFloat(nft.latestDeals?.count ?? 0) + 75
        default:
            return 0
            
        }
    }
}
