//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

enum TabBarVCString: String {
    case imagePerson = "person"
    case imageWallet = "wallet.pass"
    case imageHome = "list.bullet.rectangle"
}


class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeVC())
        let walletVC = UINavigationController(rootViewController: WalletVC())
        let profileVC = UINavigationController(rootViewController: ProfileVC())
        self.setViewControllers([homeVC, walletVC, profileVC], animated: true)
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: TabBarVCString.imageHome.rawValue)
        
        items[1].image = UIImage(systemName: TabBarVCString.imageWallet.rawValue)
        
        items[2].image = UIImage(systemName: TabBarVCString.imagePerson.rawValue)

    }
}
