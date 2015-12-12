//
//  MemeTableViewCell.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 12/6/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

/// Custom table view cell for MemeTableViewController
class MemeTableViewCell: UITableViewCell {
    /* Interface Builder outlets */
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var memeTextLabel: UILabel!
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
}
