//
//  ProfileViewModel.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 22/12/22.
//

import UIKit

class ProfileViewModel {

    public var numberOfRowsInSection: Int {
        return 2
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        switch ProfileNameCell(rawValue: indexPath.row) {
        case .backgroundImage:
            return 230
        case .userData:
            return 250
        default:
            return 0
        }
    }
}
