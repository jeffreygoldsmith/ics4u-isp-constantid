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
        
        KeyTracker.Initialize() // Initialize KeyTracker() class
        passwordLabel.stringValue = labelText // Set initial value for label text
    }
    
    @IBOutlet weak var passwordLabel: NSTextField!
    
    @IBAction func resetButton(_ sender: Any)
    {
        // Reset values to intial state and segue back to main view
        enterCount = 0
        isDeviant = true
        labelText = "Enter your password \(3 - enterCount) time(s)."
        self.view.window?.close()
        passwordLabel.stringValue = labelText
    }
    
    @IBAction func passwordField(_ sender: Any)
    {
        print("enter") // Log
        
        // If the password is correct...
        if (passwordValue == password && timingArray.count == password.characters.count)
        {
            // Process the user password data
            if (timingArray.count > 1)
            {
                KeyTracker.setNewLetterPattern(timingArray: timingArray)
            }
            
            enterCount += 1 // Increment enter count
            
            // Switch on how many times the user has typed in their password to determine what the label will say
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
            
            isDeviant = false // Reset the isDeviant value
        } else {
            labelText = "Your password value is incorrect" // Display error message
        }
        
        passwordLabel.stringValue = labelText // Display updated label value
        timingArray = [] // Reset temp array of entered characters
    }
}
