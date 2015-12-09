//
//  MemeTableViewController.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 11/29/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    // Set default text macro style attributes
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
        NSStrokeWidthAttributeName : -3.0,  // A negative value allows displaying both a fill and stroke
    ]
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedMemeCell") as! MemeTableViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.originalImage
        cell.topTextLabel.attributedText = NSAttributedString(string: meme.topText, attributes: memeTextAttributes)
        cell.bottomTextLabel.attributedText = NSAttributedString(string: meme.bottomText, attributes: memeTextAttributes)
        cell.memeTextLabel.text = meme.topText + "..." + meme.bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: navigate to meme detail view
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = memes[indexPath.row]
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    /* Interface Builder Action Functions */

    
    @IBAction func addNewMeme(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        let navigationController = UINavigationController(rootViewController: controller)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
