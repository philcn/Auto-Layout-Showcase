//
//  NSLayoutConstraint+Separator.swift
//  Triangle
//
//  Created by Phil on 15/3/21.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func setAsSeparator() {
        self.constant = 1.0 / UIScreen.mainScreen().scale
    }
}
