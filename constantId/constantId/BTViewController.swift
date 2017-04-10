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
var labelText = "Enter your password \(3 - enterCount) times."

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
        labelText = "Enter your password \(3 - enterCount) times."
        self.view.window?.close()
        passwordLabel.stringValue = labelText
    }
    
    @IBAction func passwordField(_ sender: Any)
    {
        print("enter")
        if (passwordValue == password)
        {
            if (timingArray.count > 2)
            {
                KeyTracker.setNewLetterPattern(timingArray: timingArray)
            }
            
            enterCount += 1
            
            if (enterCount >= 3)
            {
                labelText = "Try entering your password"
            } else {
                labelText = "Enter your password \(3 - enterCount) times."
            }
            
            passwordLabel.stringValue = labelText
        } else {
            labelText = "Your password value is incorrect"
            passwordLabel.stringValue = labelText
        }
        
        timingArray = []
    }
}
