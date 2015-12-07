//
//  MemeTableViewController.swift
//  MemeMeV2
//
//  Created by Joshua Hunsberger on 11/29/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedMemeCell") as! MemeTableViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.memeImage
        cell.topTextLabel.text = meme.topText
        cell.bottomTextLabel.text = meme.bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: navigate to meme detail view
    }
    
    /* Interface Builder Action Functions */

    
    @IBAction func addNewMeme(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("NewMemeViewController") as! UINavigationController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
