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
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        self.signatureDelegate()
        self.viewModel.fetch(.mock)
        self.homeScreen?.configSearchBarDelegate(delegate: self)
    }
    
    private func signatureDelegate() {
        viewModel.delegate(delegate: self)
    }
}

extension HomeVC: HomeViewModelDelegate {
    
    func success() {
        DispatchQueue.main.async {
            self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.tableView.reloadData()
            self.homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.collectionView.reloadData()
        }
    }
    
    func error(_message: String) {
        print("deu ruim \(_message)")
    }
}


extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.filterContentForSearchText(searchBar.text ?? "")
        self.homeScreen?.tableView.reloadData()
        print(searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupHomeCell(data: viewModel.loadCurrentNFT(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSectionCollection
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
        cell?.setupCollectionCell(data: viewModel.loadFilter(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.heightForRowAtCollection(indexPath: indexPath)
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setFilter(indexPath: indexPath, searchText: homeScreen?.searchBar.text ?? "")
//        homeScreen?.searchBar.text = ""
        homeScreen?.tableView.reloadData()
        homeScreen?.collectionView.reloadData()
        homeScreen?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

}
