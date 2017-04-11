//
//  BTViewController.swift
//  constantId
//
//  Created by Jeffrey on 2017-04-02.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

var KeyTracker = KeyTiming()
var enterCount = 0
var labelText = "Enter your password \(3 - enterCount) time(s)."

class BTViewController: NSViewController, NSTextFieldDelegate {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        KeyTracker.Initialize()
        passwordLabel.stringValue = labelText
    }
    
    @IBOutlet weak var passwordLabel: NSTextField!
    
    @IBAction func resetButton(_ sender: Any)
    {
        enterCount = 0
        labelText = "Enter your password \(3 - enterCount) time(s)."
        self.view.window?.close()
        passwordLabel.stringValue = labelText
    }
    
    @IBAction func passwordField(_ sender: Any)
    {
        print("enter")
        if (enterCount < 2)
        {
            enterCount += 1
            labelText = "Enter your password \(3 - enterCount) time(s)."
            passwordLabel.stringValue = labelText
            timingArray = []
            return
        }
        
        if (passwordValue == password && timingArray.count == password.characters.count)
        {
            if (timingArray.count > 1)
            {
                KeyTracker.setNewLetterPattern(timingArray: timingArray)
            }
            
            isDeviant = false
            labelText = "Try entering your password"
        } else {
            (isDeviant) ? (labelText = "Your password was typed inconsistently") : (labelText = "Your password value is incorrect")
        }
        
        passwordLabel.stringValue = labelText
        timingArray = []
    }
}
