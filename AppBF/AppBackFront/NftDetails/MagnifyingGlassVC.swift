//
//  MagnifyingGlassVC.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 17/12/22.
//

import UIKit

class MagnifyingGlassVC: UIViewController {

    var magnifyingGlassScreen: MagnifyingGlassScreen?
    
    override func loadView() {
        self.magnifyingGlassScreen = MagnifyingGlassScreen()
        self.view = magnifyingGlassScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
