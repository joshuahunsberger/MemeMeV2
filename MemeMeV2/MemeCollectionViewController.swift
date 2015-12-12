//
//  MemeCollectionViewController.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 11/29/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    /* Interface Builder outlet variables */
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    /// Contains a message for the user when there are no memes for the collection view to display
    var messageLabel: UILabel!
    
    /// Local variable for share meme array
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    // Default text macro style attributes
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
        NSStrokeWidthAttributeName : -3.0,  // A negative value allows displaying both a fill and stroke
    ]

    
    /* Life cycle functions */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let wDimension = (self.view.frame.width - (2*space)) / 3.0
        let hDimension = (self.view.frame.height - (2*space)) / 6.0
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(wDimension, hDimension)
        
        messageLabel = UILabel(frame: CGRectMake(0,0,collectionView!.bounds.size.width,collectionView!.bounds.size.height))
        messageLabel.text = "No memes to show. Add one with the + button."
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.sizeToFit()
        collectionView!.backgroundView = messageLabel
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    /* Collection view functions */
    
    /// Gets the number of memes in the shared meme array, displaying a text label if there are 0 memes.
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(memes.count == 0){
            messageLabel.hidden = false
        } else {
            messageLabel.hidden = true
        }
        
        return memes.count
    }
    
    /// Displays a custom collection view cell populated with meme details
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SavedMemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.originalImage
        cell.topTextLabel.attributedText = NSAttributedString(string: meme.topText, attributes: memeTextAttributes)
        cell.bottomTextLabel.attributedText = NSAttributedString(string: meme.bottomText, attributes: memeTextAttributes)
        
        return cell
    }
    
    /// Displays the meme from the selected cell in a new view and pushes that view onto the navigation stack
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = memes[indexPath.row]
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    /* Interface Builder action functions */
    
    /// Presents the meme editor view
    @IBAction func addNewMeme(sender: UIBarButtonItem) {
        let navController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorNavigationController") as! UINavigationController
        self.presentViewController(navController, animated: true, completion: nil)
    }
}
