//
//  ALNavigationController.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class ALNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Mark: 三件套

    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return .Slide
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
/*
        if let style = self.viewControllers.last?.preferredStatusBarStyle() {
            return style
        }
        return .LightContent
*/
    }

    override func prefersStatusBarHidden() -> Bool {
        if let hides = self.viewControllers.last?.prefersStatusBarHidden() {
            return hides
        }
        return false
    }
}
