//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

class HomeVC: UIViewController {
    
    
    var homeScreen: HomeScreen?
    let viewModel: HomeViewModel = HomeViewModel()
    
    var nftTest: [NFTTest] = [NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:"),
                              NFTTest(imageNFT: "person", imageUser: "person", nameUser: "Bárbara", price: "Preço", priceValue: "2000", ownedBy: "Possuído por:")]
    
    var filterTest: [FilterName] = [FilterName(filter: "Todos"),
                                    FilterName(filter: "3D"),
                                    FilterName(filter: "Ilustração"),
                                    FilterName(filter: "Fotos"),
                                    FilterName(filter: "GIFs")]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.viewModel.fetch()
        self.signatureDelegate()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)
    }
    
    private func signatureDelegate() {
        viewModel.delegate(delegate: self)
    }
}

extension HomeVC: HomeViewModelDelegate {
    
    func success() {
        
//        assinar protocolos da collection view
    }
    
    func error(_message: String) {
        print("deu ruim \(_message)")
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.nftTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupHomeCell(data: self.nftTest[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 360
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTest.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
        cell?.setupCollectionCell(data: self.filterTest[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 60)
    }
    
}
