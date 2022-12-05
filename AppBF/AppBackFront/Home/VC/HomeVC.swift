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
