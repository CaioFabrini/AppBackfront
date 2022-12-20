//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 20/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(cornerRadiuns: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
    
}
