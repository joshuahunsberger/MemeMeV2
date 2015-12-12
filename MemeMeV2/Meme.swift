//
//  Meme.swift
//  MemeMeV2 - MemeMe Version 2.0
//
//  Created by Joshua Hunsberger on 11/15/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

/**
    Struct that represents the meme model
 
    - topText: Stores the text on the top the image macro
    - bottomText: Stores the text on the bottom of the image macro
    - originalImage: Image that underlies the image macro
    - memeImage: Single image that combines the original image and both overlaid text fields
*/
struct Meme {
    /// Contents of the top image macro text
    var topText : String
    /// Contents of the bottom image macro text
    var bottomText : String
    /// Original "un-memed" image
    var originalImage : UIImage
    /// Image with overlaid text
    var memeImage : UIImage
    
}
