//
//  HomeScreen.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 04/12/22.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "vector")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 20
        search.placeholder = "Pesquise por categorias, artistas..."
//      Alterar cor de fundo e lupa
        return search
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        collectionView.delaysContentTouches = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSuperView()
        setupConstraints()
    }
    
    public func logoImage(data: NFTHomeData) {
        guard let urlLogo = URL(string: data.logoImage?.image ?? "") else { return }
        self.logoImageView.af.setImage(withURL: urlLogo)
    }
    
    private func addSuperView() {
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.logoImageView)
        self.viewBackgraund.addSubview(self.searchBar)
        self.viewBackgraund.addSubview(self.collectionView)
        self.addSubview(self.tableView)
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    public func configSearchBarDelegate(delegate: UISearchBarDelegate) {
        self.searchBar.delegate = delegate
    }
    
    public func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 220),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor, constant: 45),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 40),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            self.searchBar.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 10),
            self.searchBar.leadingAnchor.constraint(equalTo: self.logoImageView.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -24),
            self.searchBar.heightAnchor.constraint(equalToConstant: 46),
            
            self.collectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 15),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.viewBackgraund.bottomAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.viewBackgraund.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
