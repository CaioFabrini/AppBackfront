//
//  CACornerMask+Extension.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 20/12/22.
//

import Foundation
import UIKit

extension CACornerMask {
    
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
    
}

