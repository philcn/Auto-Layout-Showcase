//
//  SpringAnimations.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

extension UIView {
    class func animateDefaultSpringAnimation(animation: () -> Void) {
        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .allZeros, animations: animation, completion: nil)
    }
}
