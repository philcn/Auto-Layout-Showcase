//
//  UITableView+ContentTouches.swift
//  Triangle
//
//  Created by Phil on 15/3/22.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

extension UITableView {
    // avoid tableview delaying touch began event of cell *subviews*.
    func optimizeForContentTouches() {
        for view: AnyObject in self.subviews {
            if NSStringFromClass(view.dynamicType) == "UITableViewWrapperView" {
                // hack for swift arbitrary message send.
                NSTimer.scheduledTimerWithTimeInterval(0, target: view, selector: Selector("setDelaysContentTouches:"), userInfo: false, repeats: false)
            }
        }
    }
}
