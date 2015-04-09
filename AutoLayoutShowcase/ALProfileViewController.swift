//
//  ALProfileViewController.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class ALProfileViewController: UITableViewController {

    lazy var profileHeaderView :TRProfileHeaderView = TRProfileHeaderView.viewFromNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.optimizeForContentTouches()
        self.tableView.addParallaxWithView(self.profileHeaderView, andHeight: 225, andShadow: false)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ALProfileTableViewCell", forIndexPath: indexPath) as! UITableViewCell

        return cell
    }
}
