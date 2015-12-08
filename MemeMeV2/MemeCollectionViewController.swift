//
//  MemeCollectionViewController.swift
//  MemeMeV2
//
//  Created by Joshua Hunsberger on 11/29/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidAppear(animated: Bool) {
        collectionView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SavedMemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell

        cell.memeImageView.image = memes[indexPath.row].memeImage
        
        return cell
    }
    
    /* Interface Builder action functions */
    
    @IBAction func addNewMeme(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        let navigationController = UINavigationController(rootViewController: controller)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
