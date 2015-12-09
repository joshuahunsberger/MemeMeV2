//
//  MemeDetailViewController.swift
//  MemeMeV2 - MemeMe Version 2.0
//
//  Created by Joshua Hunsberger on 12/9/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    /* Interface Builder Outlet variables */
    @IBOutlet weak var memeImageView: UIImageView!
    
    // Meme variable
    var meme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memeImageView.image = meme.memeImage
    }
}
