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
        tabBarController?.tabBar.hidden = true
        memeImageView.image = meme.memeImage
    }
    
    override func viewDidLoad() {
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editMeme:")
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.hidden = false
    }
    
    func editMeme(sender: UIBarButtonItem){
        let memeEditorViewController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        let navigationController = UINavigationController(rootViewController: memeEditorViewController)

        self.presentViewController(navigationController, animated: true, completion:
            {
                memeEditorViewController.topTextField.text = self.meme.topText
                memeEditorViewController.bottomTextField.text = self.meme.bottomText
                memeEditorViewController.imagePickerView.image = self.meme.originalImage
                memeEditorViewController.shareButton.enabled = true
                
            }
        )
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
}
