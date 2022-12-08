//
//  NFTHomeData.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 07/12/22.
//

import Foundation

// MARK: - NFTHomeData
struct NFTHomeData: Codable {
    var logoImage: LogoImage?
    var filterNft: [FilterNft]?
    var nftList: [NftList]?

}

// MARK: - FilterNft
struct FilterNft: Codable {
    var title: String?
}

// MARK: - LogoImage
struct LogoImage: Codable {
    var image: String?
}

// MARK: - NftList
struct NftList: Codable {
    var ownedBy: String?
    var price: String?
    var ntfImage: String?
    var userName: String?
    var userImage: String?
    var nftPrice: Double?
    var nftID: Int?
    var nftNameImage, nftDescription: String?
    var titleLatestDeals: String?
    var latestDeals: [LatestDeal]?

}

// MARK: - LatestDeal
struct LatestDeal: Codable {
    var userName: String?
    var userImage: String?
    var nftPrice: Double?
    var lastAccess: String?

}


