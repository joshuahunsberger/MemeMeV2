//
//  MemeCollectionViewCell.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 12/6/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

/// Custom collection view cell for MemeCollectionViewController
class MemeCollectionViewCell: UICollectionViewCell {
    /* Interface Builder outlets */
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
}
