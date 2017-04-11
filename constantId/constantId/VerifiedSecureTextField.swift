//
//  VerifiedSecureTextField.swift
//  constantId
//
//  Created by Jeffrey on 2017-04-03.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa
import Foundation

var passwordValue = "" // Second stage password value

class VerifiedSecureTextField: NSSecureTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func textDidChange(_ notification: Notification) {
        let date = NSDate().timeIntervalSince1970 // Timestamp value for processing
        passwordValue = self.stringValue // Password value
        
        // If there is a password value append the letter value to the array of letters
        if (passwordValue.characters.count > 0)
        {
            let letter = "\(passwordValue[passwordValue.index(before: passwordValue.endIndex)])" // Get the most recent letter pressed
            //Swift.print(letter)
            let currentKeystroke = Keystroke(letter: letter, timestamp: date) // Create a new keystroke variable
            timingArray.append(currentKeystroke) // Add it to the array
        }
    }
}
