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
        isDeviant = true
        labelText = "Enter your password \(3 - enterCount) time(s)."
        self.view.window?.close()
        passwordLabel.stringValue = labelText
    }
    
    @IBAction func passwordField(_ sender: Any)
    {
        print("enter")
        print(isDeviant)
        if (passwordValue == password && timingArray.count == password.characters.count)
        {
            if (timingArray.count > 2)
            {
                KeyTracker.setNewLetterPattern(timingArray: timingArray)
            }
            
            enterCount += 1
            
            switch enterCount {
            case 0...2:
                labelText = "Enter your password \(3 - enterCount) time(s)."
                break
            case 3:
                labelText = "Try entering your password"
                break
            default:
                isDeviant ? (labelText = "You have typed your password inconsistently") : (labelText = "You have entered your password correctly!")
                break
            }
            
//            if (enterCount >= 3)
//            {
//                isDeviant ? (labelText = "You have typed your password inconsistently") : (labelText = "Try entering your password")
//            } else {
//                labelText = "Enter your password \(3 - enterCount) time(s)."
//            }
            
            isDeviant = false
        } else {
            labelText = "Your password value is incorrect"
        }
        
        passwordLabel.stringValue = labelText
        timingArray = []
    }
}
