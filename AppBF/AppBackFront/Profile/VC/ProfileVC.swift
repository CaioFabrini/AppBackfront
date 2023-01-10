//
//  ProfileVC.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import UIKit

enum ProfileNameCell: Int {
    case backgroundImage = 0
    case userData = 1
}

class ProfileVC: UIViewController {
    
    var profileScreen: ProfileScreen?
    let viewModel: ProfileViewModel = ProfileViewModel()
    
    override func loadView() {
        self.profileScreen = ProfileScreen()
        self.view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension ProfileVC: UITableViewDelegate {
}

extension ProfileVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileNameCell(rawValue: indexPath.row){
        case .backgroundImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: BackgroundImageTableViewCell.identifier, for: indexPath) as? BackgroundImageTableViewCell
            return cell ?? UITableViewCell()
        case .userData:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDataTableViewCell.identifier, for: indexPath) as? UserDataTableViewCell
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
