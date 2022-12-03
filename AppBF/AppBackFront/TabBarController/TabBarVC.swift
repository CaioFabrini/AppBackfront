//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

enum TabBarVCString: String {
    case imagePencil = "pencil"
    case imageScribble = "scribble"
    case imageTrash = "trash"
    case imageLogoBF = "bfTabBar"
}


class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeVC())
        let walletVC = UINavigationController(rootViewController: WalletVC())
        let addNewNFTVC = UINavigationController(rootViewController: AddNewNFTVC())
        let profileVC = UINavigationController(rootViewController: ProfileVC())
        self.setViewControllers([homeVC, walletVC, addNewNFTVC, profileVC], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: TabBarVCString.imageLogoBF.rawValue)
        
        items[1].image = UIImage(systemName: TabBarVCString.imageTrash.rawValue)
        
        items[2].image = UIImage(systemName: TabBarVCString.imageScribble.rawValue)
        
        items[4].image = UIImage(systemName: TabBarVCString.imagePencil.rawValue)

    }



}
