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
    
    var numberOfRowsInSection: Int {
        return 1
    }
    
    var getNFTImage: String {
        return nft.ntfImage ?? ""
    }
    
    var idNFT: Int {
        return nft.nftID ?? 0
    }
    
   
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    
}
