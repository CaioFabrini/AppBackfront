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
        return 2
    }
    
    public var getNFTImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNFT: Int {
        return nft.nftID ?? 0
    }
    
    public var titleLabel: String {
        return nft.nftNameImage ?? ""
    }
    
    public var descriptionLabel: String{
        return nft.nftDescription ?? ""
    }
    
    public func heightForRowAt(indexPath: IndexPath, widht: CGFloat) -> CGFloat {
        
        switch NameCell(rawValue: indexPath.row){
        case .nftImage:
            return 400
        case .descripition:
            let heightLabel = descriptionLabel.height(withConstrainedWidth: widht - 40, font: UIFont.systemFont(ofSize: 18))
            return 5 + heightLabel + 5 + 30 + 5 + 24 + 10 + 10
        default:
            return 0
            
        }
    }
    
}
