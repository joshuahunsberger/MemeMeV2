//
//  MemeTableViewController.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 11/29/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    /// Contains a message for the user when there are no memes for the table view to display
    var emptyMessageLabel: UILabel!
    
    /// Local variable for share meme array
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    /// Default text macro style attributes
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
        NSStrokeWidthAttributeName : -3.0,  // A negative value allows displaying both a fill and stroke
    ]
    
    
    /* Life cycle functions */
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emptyMessageLabel = UILabel(frame: CGRectMake(0,0,tableView.bounds.size.width,tableView.bounds.size.height))
        emptyMessageLabel.text = "No memes to show. Add one with the + button."
        emptyMessageLabel.textAlignment = NSTextAlignment.Center
        emptyMessageLabel.sizeToFit()
        tableView.backgroundView = emptyMessageLabel
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    
    /* Table view functions */
    
    /// Gets the number of memes in the shared meme array, displaying a text label if there are 0 memes.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(memes.count == 0){
            emptyMessageLabel.hidden = false
        } else{
            emptyMessageLabel.hidden = true
        }
        return memes.count
    }
    
    /// Displays a custom table view cell populated with meme details
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedMemeCell") as! MemeTableViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.originalImage
        cell.topTextLabel.attributedText = NSAttributedString(string: meme.topText, attributes: memeTextAttributes)
        cell.bottomTextLabel.attributedText = NSAttributedString(string: meme.bottomText, attributes: memeTextAttributes)
        cell.memeTextLabel.text = meme.topText + "..." + meme.bottomText
        
        return cell
    }
    
    /// Displays the meme from the selected cell in a new view and pushes that view onto the navigation stack
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = memes[indexPath.row]
        
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    /// Returns true to indicate that all cells can be edited
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    ///Removes the current meme from the array if the delete button is selected
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.memes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    
    /* Interface Builder Action Functions */

    /// Presents the meme editor view
    @IBAction func addNewMeme(sender: UIBarButtonItem) {        
        let navController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorNavigationController") as! UINavigationController
        presentViewController(navController, animated: true, completion: nil)
    }
}
