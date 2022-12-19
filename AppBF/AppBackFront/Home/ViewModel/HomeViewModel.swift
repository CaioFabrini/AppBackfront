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
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }

    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getHomefromJson { success, error in
                if let success = success {
                    self.getNftData = success
                    self.searchNftData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        case .request:
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
    
    var typeFilter: Int? {
        return searchNftData?.filterNft?.first(where: {$0.isSelected == true})?.id
    }
    
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func loadCurrentNFT(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
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
    
    public func setFilter(indexPath: IndexPath, searchText: String) {
        var filterNFT: [FilterNft] = []
        for (indices,value) in (searchNftData?.filterNft ?? []).enumerated() {
            var type = value
            if indices == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNftData?.filterNft = filterNFT
        filterContentForSearchText(searchText)
    }
    
    public func filterContentForSearchText(_ searchText: String) {
        
        var nftList: [Nft] = []
        
        if self.typeFilter == 0  /* o zero significa todos */ {
            nftList = getNftData?.nftList ?? []
        } else {
            nftList = getNftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        if searchText == "" {
            self.searchNftData?.nftList = nftList
        } else {
            self.searchNftData?.nftList = nftList.filter({ (nft: Nft) -> Bool in
                return nft.userName?.lowercased().contains(searchText.lowercased()) ?? false
            })
        }
    }
    
    
}

