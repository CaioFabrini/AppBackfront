//
//  MagnifyingGlassVC.swift
//  AppBackFront
//
//  Created by Alexandre Brigolin on 17/12/22.
//

import UIKit
import AlamofireImage

class MagnifyingGlassVC: UIViewController {

    var magnifyingGlassScreen: MagnifyingGlassScreen?
    var urlImage: String
    
    override func loadView() {
        self.magnifyingGlassScreen = MagnifyingGlassScreen()
        self.view = magnifyingGlassScreen
    }
    
    required init(url: String) {
        self.urlImage = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupURL()
        self.magnifyingGlassScreen?.delegate(delegate: self)
    }
    
    func setupURL(){
        guard let url = URL(string: urlImage) else { return }
        self.magnifyingGlassScreen?.nftImageView.af.setImage(withURL: url)
    }
}

extension MagnifyingGlassVC: MagnifyingGlassScreenProtocol {
    func tappedReturn() {
        dismiss(animated: true)
    }
}
