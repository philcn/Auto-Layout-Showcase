//
//  ALLayoutContainerViewController.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class ALLayoutContainerViewController: UIViewController {

    private var containerViewWidthIndex: Int? {
        didSet {
            containerViewWidthConstraint.constant = [360, 300, 240][containerViewWidthIndex!]
            animateFrameChange()
        }
    }

    private var containerViewHeightIndex: Int? {
        didSet {
            containerViewHeightConstraint.constant = [580, 430, 280][containerViewHeightIndex!]
            animateFrameChange()
        }
    }

    private var contentViewController: UIViewController?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!

    @IBAction func rearrangeHorizontally(sender: AnyObject) {
        self.containerViewWidthIndex = (self.containerViewWidthIndex! + 1) % 3
    }

    @IBAction func rearrangeVertically(sender: AnyObject) {
        self.containerViewHeightIndex = (self.containerViewHeightIndex! + 1) % 3
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.containerViewWidthIndex = 0
        self.containerViewHeightIndex = 0
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ContentViewController" {
            if let controller = segue.destinationViewController as? UIViewController {
                self.contentViewController = controller
            }
        }
    }

    private func animateFrameChange() {
        UIView.animateDefaultSpringAnimation {
            self.view.layoutIfNeeded()
        }
    }
}

