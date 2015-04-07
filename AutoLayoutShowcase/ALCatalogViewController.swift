//
//  ALCatalogViewController.swift
//  AutoLayoutShowcase
//
//  Created by Phil on 15/4/2.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

import UIKit

class ALCatalogViewController: UITableViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        if let indexPath = tableView.indexPathsForSelectedRows()?.first as? NSIndexPath {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
}

