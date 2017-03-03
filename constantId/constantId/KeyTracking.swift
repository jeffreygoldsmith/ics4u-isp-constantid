//
//  KeyTracking.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-23.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa
import Foundation

struct Keystroke
{
    var letter : String
    var timestamp : Double
    
    init(letter: String, timestamp: Double)
    {
        self.letter = letter
        self.timestamp = timestamp
    }
}

var timingArray : [Keystroke] = []

class KeyTracking: NSWindow
{
    //
    // Key press event listener
    //
    override func keyDown(with event: NSEvent)
    {
        // Ensure that the first character is not an enter or a space
        if (timingArray.count == 0)
        {
            if (event.keyCode == 49 || event.keyCode == 36)
            {
                return
            }
        }
        
        // If the character typed is one that we care about...
        if ((alphabet.filter{$0 == event.characters!}.first) != nil || event.keyCode == 49 || event.keyCode == 36)
        {
            var letter = ""
            switch event.keyCode {
            case 49:
                letter = "space"
            case 36:
                letter = "enter"
            default:
                letter = event.characters!
            }
            
            let currentKeystroke = Keystroke(letter: letter, timestamp: event.timestamp) // Create a new keystroke variable
            timingArray.append(currentKeystroke) // Add it to the array
        }
        
        // When space or enter is pressed:
        if (event.keyCode == 49 || event.keyCode == 36)
        {
            // if we also have a full set of data
            if (timingArray.count >= 2)
            {
                Swift.print(timingArray)
                KeyTracker.setNewLetterPattern(event: event, timingArray: timingArray)
                
                timingArray = [] // Clean the array
                
                return
            }
        }
    }
}
