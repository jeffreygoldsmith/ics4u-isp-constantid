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
    
    @IBOutlet weak var passwordLabel: NSTextField!
    
    @IBAction func resetButton(_ sender: Any)
    {
        self.view.window?.close()
        enterCount = 0
    }
    
    @IBAction func passwordField(_ sender: Any)
    {
        print("enter")
        if (passwordValue == password)
        {
            enterCount += 1
            
            labelText = "Enter your password \(3 - enterCount) times."
            
            if (enterCount == 3)
            {
                labelText = "Try entering your password"
            }
            
            passwordLabel.stringValue = labelText
        } else {
            labelText = "Your password value is incorrect"
            passwordLabel.stringValue = labelText
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        KeyTracker.Initialize()
        passwordLabel.stringValue = labelText
    }
}
