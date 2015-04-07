//
//  ALDynamicLayoutViewController.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class ALDynamicLayoutViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var commentIcon: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var avatarView: TRCircleAvatarView!

    private var comment: String? {
        didSet {
            self.commentLabel!.text = self.comment!
            UIView.animateDefaultSpringAnimation {
                self.view.layoutIfNeeded()
            }
        }
    }

    private var comments: [String] = ["日本北海道西南部重要港市，位于北海道之南岸，南临太平洋，隔着津轻海峡与本州岛的青森相望。",
                                      "函馆是日本北海道西南部重要港市。",
                                      "函馆是北海道的南大门，与横滨、长崎一样，也是一座历史悠久的港口贸易城市。最先门户开放的日本港口之一，另一个是下关。"]

    private var commentIndex: Int = 0 {
        didSet {
            self.comment = self.comments[commentIndex]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarView.whenTapped {
            self.randomizeContent()
        }

        self.view.layer.borderWidth = 2.0
        self.view.layer.borderColor = UIColor(hex: 0x2A2077).CGColor
    }

    func randomizeContent() {
        self.commentIndex = (self.commentIndex + 1) % self.comments.count
    }
}
