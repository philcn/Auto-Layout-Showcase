//
//  TRCircleAvatarView.swift
//  Triangle
//
//  Created by Phil on 15/3/21.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class TRCircleAvatarView: UIView  {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.bounds.rectByInsetting(dx: self.borderWidth, dy: self.borderWidth))
        imageView.layer.cornerRadius = imageView.bounds.width / 2.0
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var borderLayer: CAShapeLayer = {
        let borderLayer = CAShapeLayer()
        borderLayer.path = UIBezierPath(ovalInRect: self.bounds).CGPath
        return borderLayer
    }()

    lazy var maskLayer: CAShapeLayer = {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(ovalInRect: self.imageView.bounds).CGPath
        maskLayer.fillColor = UIColor.blackColor().colorWithAlphaComponent(0.4).CGColor
        maskLayer.hidden = true
        return maskLayer
    }()

    var avatarTappedCallback: (() -> Void)?

    var highlighted: Bool = false {
        didSet {
            self.maskLayer.hidden = !highlighted
        }
    }

    @IBInspectable var borderLineWidth: CGFloat = 0 {
        didSet {
            self.borderLayer.lineWidth = borderLineWidth
        }
    }

    @IBInspectable var borderLineColor: UIColor = UIColor.clearColor() {
        didSet {
            self.borderLayer.strokeColor = borderLineColor.CGColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            self.imageView.frame = self.bounds.rectByInsetting(dx: borderWidth, dy: borderWidth)
            self.imageView.layer.cornerRadius = imageView.bounds.width / 2.0
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.borderLayer.fillColor = borderColor.CGColor
        }
    }

    @IBInspectable var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
        self.layer.insertSublayer(self.borderLayer, atIndex: 0)
        self.imageView.layer.addSublayer(self.maskLayer)
        self.addSubview(self.imageView)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("avatarTapped:"))
        tapGestureRecognizer.delaysTouchesEnded = false
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    func avatarTapped(sender: UITapGestureRecognizer) {
        if let callback = self.avatarTappedCallback {
            callback()
        }
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.highlighted = true
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.highlighted = false
    }

    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.highlighted = false
    }

    func whenTapped(callback: () -> Void) {
        self.avatarTappedCallback = callback
    }
}
