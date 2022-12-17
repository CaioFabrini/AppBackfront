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
    private var getNftData: NFTHomeData?
    private var searchNftData: NFTHomeData?
    
    private weak var delegate: HomeViewModelDelegate?
//    private var typeFilter: String?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }

    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { success, error in
                if let success = success {
                    self.getNftData = success
                    self.searchNftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case.request:
            self.service.getHome { success, error in
                if let success = success {
                    self.getNftData = success
                    self.searchNftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    var typeFilter: String? {
        // TO DO: SUBSTITUIR POR ID
        return searchNftData?.filterNft?.first(where: {$0.isSelected == true})?.title
    }
    
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func loadCurrentNFT(indexPath: IndexPath) -> NftList {
        return searchNftData?.nftList?[indexPath.row] ?? NftList()
    }
    
    public func filterContentForSearchText(_ searchText: String) {
        if searchText == "" {
            self.searchNftData?.nftList = getNftData?.nftList
        } else {
            self.searchNftData?.nftList = getNftData?.nftList?.filter({ (nft: NftList) -> Bool in
                if let typeFilter = typeFilter {
                    if typeFilter == "Todos" {
                        return nft.userName?.lowercased().contains(searchText.lowercased()) ?? false
                    } else {
                        return (nft.userName?.lowercased().contains(searchText.lowercased()) ?? false) && (nft.type == typeFilter)
                    }
                }
                return nft.userName?.lowercased().contains(searchText.lowercased()) ?? false
            })
        }
    }
    
    public var numberOfRowsInSectionCollection: Int {
        return searchNftData?.filterNft?.count ?? 0
    }
    
    func loadFilter(indexPath: IndexPath) -> FilterNft {
        return searchNftData?.filterNft?[indexPath.row] ?? FilterNft()
    }
    
    public func heightForRowAtCollection(indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 60)
    }
    
    public func setFilter(indexPath: IndexPath) {
        for indices in (getNftData?.filterNft ?? []).indices {
            if indices == indexPath.row {
                getNftData?.filterNft?[indexPath.row].isSelected = true
                searchNftData?.filterNft?[indexPath.row].isSelected = true
            } else {
                getNftData?.filterNft?[indexPath.row].isSelected = false
                searchNftData?.filterNft?[indexPath.row].isSelected = false
            }
        }
    }
}

