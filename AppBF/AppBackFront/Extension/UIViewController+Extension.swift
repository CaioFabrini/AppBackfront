//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 20/12/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
