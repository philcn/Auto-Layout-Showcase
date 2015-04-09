//
//  TRProfileHeaderView.swift
//  Triangle
//
//  Created by Phil on 15/3/29.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

protocol TRProfileHeaderData {
    var nickname: String { get }
    var avatarURL: String { get }
    var joinedTime: NSDate? { get }
    var activeLocation: String? { get }
    var statsPostCount: Int { get }
    var statsFollowCount: Int { get }
    var statsLiveness: Double { get }
}

@objc protocol TRProfileHeaderDelegate: class {
    optional func profileHeaderAvatarTapped()
}

class TRProfileHeaderView: UIView {

    weak var delegate: TRProfileHeaderDelegate?

    @IBOutlet weak var avatarView: TRCircleAvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var supplementaryLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followCountLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet var separatorConstraints: [NSLayoutConstraint]!

    override func awakeFromNib() {
        separatorConstraints.map { $0.setAsSeparator() }
    }

    var entity: TRProfileHeaderData? {
        didSet {
            self.avatarView.whenTapped { [weak self] in
                self?.delegate?.profileHeaderAvatarTapped?()
                return // fuck xcode 6.2 bug
            }

            self.nameLabel.text = entity!.nickname

            if let joinedTime = entity?.joinedTime {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy 年 MM 月 dd 日"
                self.subtitleLabel.text = "\(formatter.stringFromDate(joinedTime))加入"
            }

            if let activeLocation = entity?.activeLocation {
                self.supplementaryLabel.text = "最近活跃于：\(activeLocation)"
            }

            self.postCountLabel.text = "\(entity!.statsPostCount)"
            self.followCountLabel.text = "\(entity!.statsFollowCount)"
            self.activityLabel.text = "\(Int(entity!.statsLiveness * 100 % 100))%"
        }
    }
}

extension TRProfileHeaderView {
    class func viewFromNib() -> TRProfileHeaderView? {
        let views = UINib(nibName: "TRProfileHeaderView", bundle: nil).instantiateWithOwner(nil, options: nil)
        for view in views {
            if view.isKindOfClass(self) {
                return view as? TRProfileHeaderView
            }
        }
        return nil
    }
}
