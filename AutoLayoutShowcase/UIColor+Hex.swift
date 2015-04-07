//
//  UIColor+Hex.swift
//  Triangle
//
//  Created by Phil on 15/3/21.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0

        self.init(red:red, green:green, blue:blue, alpha:1.0)
    }
}
