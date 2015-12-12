//
//  MemeMeTextFieldDelegate.swift
//  MemeMeV2 - MemeMe 2.0
//
//  Created by Joshua Hunsberger on 11/14/15.
//  Copyright © 2015 Joshua Hunsberger. All rights reserved.
//

import UIKit

/** 
    A text field delegate for the image macro text fields
    
    Describes how the text fields should behave when the return key is pressed
    and when the the text field is clicked with the default text
*/
class MemeMeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    /// Dismisses the keyboard when the return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// Clear the text field if default text ("TOP" or "BOTTOM")
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.text == "TOP" || textField.text == "BOTTOM"){
            textField.text = ""
        }
    }
    
}
