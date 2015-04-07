//
//  NSDate+Format.swift
//  Triangle
//
//  Created by Phil on 15/3/30.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import Foundation

extension NSDate {
    private func dateStringWithFormat(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }

    func fullDateString() -> String {
        return self.dateStringWithFormat("yyyy/MM/dd")
    }

    func shortDateString() -> String {
        return self.dateStringWithFormat("M月d日")
    }
}
