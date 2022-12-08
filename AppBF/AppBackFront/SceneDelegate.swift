//
//  SceneDelegate.swift
//  AppBackFront
//
//  Created by Caio Fabrini on 15/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    //    {
    //        "owned_by": "Propriedade de:",
    //        "price": "Preço",
    //        "ntf_image": "https://i.im.ge/2022/12/07/SzmW0K.nft1.png",
    //        "user_name": "Mason Yates",
    //        "user_image": "https://i.im.ge/2022/12/07/SzNVML.user1.jpg",
    //        "nft_price": 1.4,
    //        "nft_id": 2345,
    //        "nft_name_image": "Cubo Mágico",
    //        "nft_description": "Jogo tridimensional composto por faces de cores diferentes.",
    //        "title_latest_deals": "Últimas Ofertas",
    //        "latest_deals": [
    //            {
    //                "user_name": "Thomas D. Harrington",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNVML.user1.jpg",
    //                "nft_price": 2.4,
    //                "last_access": "2h atrás"
    //            },
    //            {
    //                "user_name": "Clara G. Natal",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNZgc.user2.jpg",
    //                "nft_price": 0.8,
    //                "last_access": "5h atrás"
    //            },
    //            {
    //                "user_name": "Niamh Noble",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNRr0.user3.jpg",
    //                "nft_price": 3.9,
    //                "last_access": "2d atrás"
    //            },
    //            {
    //                "user_name": "Elliot Walters",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNW5T.user4.jpg",
    //                "nft_price": 7.1,
    //                "last_access": "1h atrás"
    //            },
    //            {
    //                "user_name": "Yasmin Patel",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNgVW.user5.jpg",
    //                "nft_price": 9.2,
    //                "last_access": "4d atrás"
    //            },
    //            {
    //                "user_name": "Joel Bradshaw",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNfDG.user6.jpg",
    //                "nft_price": 3.4,
    //                "last_access": "8h atrás"
    //            },
    //            {
    //                "user_name": "Holly Bryan",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNzJa.user8.jpg",
    //                "nft_price": 2.2,
    //                "last_access": "1d atrás"
    //            },
    //            {
    //                "user_name": "Taylor Bryan",
    //                "user_image": "https://i.im.ge/2022/12/07/SzNpSJ.user9.jpg",
    //                "nft_price": 5.6,
    //                "last_access": "6h atrás"
    //            }
    //        ]
    //    }
    
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        var lastDetail: [LatestDeal] = [
            LatestDeal(userName: "Thomas D. Harrington",userImage: "https://i.im.ge/2022/12/07/SzNVML.user1.jpg",nftPrice: 2.4,lastAccess: "2h atrás"),
            LatestDeal(userName: "Clara G. Natal",userImage: "https://i.im.ge/2022/12/07/SzNZgc.user2.jpg",nftPrice: 0.8,lastAccess: "5h atrás"),
            LatestDeal(userName: "Niamh Noble",userImage: "https://i.im.ge/2022/12/07/SzNRr0.user3.jpg",nftPrice: 3.9,lastAccess: "2d atrás"),
            LatestDeal(userName: "Elliot Walters",userImage: "https://i.im.ge/2022/12/07/SzNW5T.user4.jpg",nftPrice: 7.1,lastAccess: "1h atrás"),
            LatestDeal(userName: "Yasmin Patel",userImage: "https://i.im.ge/2022/12/07/SzNgVW.user5.jpg",nftPrice: 9.2,lastAccess: "4d atrás"),
            LatestDeal(userName: "Joel Bradshaw",userImage: "https://i.im.ge/2022/12/07/SzNfDG.user6.jpg",nftPrice: 3.4,lastAccess: "8h atrás"),
            LatestDeal(userName: "Holly Bryan",userImage: "https://i.im.ge/2022/12/07/SzNzJa.user8.jpg",nftPrice: 2.2,lastAccess: "1d atrás"),
            LatestDeal(userName: "Taylor Bryan",userImage: "https://i.im.ge/2022/12/07/SzNpSJ.user9.jpg",nftPrice: 5.6,lastAccess: "6h atrás"),
        ]
        
        var nftList = NftList(ownedBy: "Propriedade de:", price: "Preço", ntfImage: "https://i.im.ge/2022/12/07/SzmW0K.nft1.png")
        
        let vc: NftDetailsVC = NftDetailsVC(nft: nftList)
        
        //        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

