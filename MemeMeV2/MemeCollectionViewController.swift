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
    var emptyMessageLabel: UILabel!
    
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
        
        configureFlowLayout(view.frame.size)
        
        emptyMessageLabel = UILabel(frame: CGRectMake(0,0,collectionView!.bounds.size.width,collectionView!.bounds.size.height))
        emptyMessageLabel.text = "No memes to show.\nAdd one with the + button."
        emptyMessageLabel.textAlignment = NSTextAlignment.Center
        emptyMessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        emptyMessageLabel.numberOfLines = 2
        emptyMessageLabel.sizeToFit()
        collectionView!.backgroundView = emptyMessageLabel
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // Check if flowlayout is instantiated from storyboard yet.  This can be called before it is set up.
        if let _ = flowLayout{
            configureFlowLayout(size)
        }
    }
    
    
    /* Collection view functions */
    
    /// Gets the number of memes in the shared meme array, displaying a text label if there are 0 memes.
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(memes.count == 0){
            emptyMessageLabel.hidden = false
        } else {
            emptyMessageLabel.hidden = true
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
        let detailController = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = memes[indexPath.row]
        
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    
    /* Custom functions */
    
    /// Resets the flow layout attributes
    func configureFlowLayout(size: CGSize){
        let space: CGFloat = 3.0
        let minOrientationSize = min(size.height, size.width)
        let dimension = (minOrientationSize - (2*space)) / 3.0
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    
    /* Interface Builder action functions */
    
    /// Presents the meme editor view
    @IBAction func addNewMeme(sender: UIBarButtonItem) {
        let navController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorNavigationController") as! UINavigationController
        presentViewController(navController, animated: true, completion: nil)
    }
}
