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
var KeyDictionary = KeyTiming()

class KeyTracking: NSWindow
{
    //
    // Key press event listener
    //
    override func keyDown(with event: NSEvent)
    {
        if (event.keyCode == 49 && timingArray.count >= 1) // When space is pressed:
        {
            KeyDictionary.setNewLetterPattern(event: event, timingArray: timingArray)
            
            timingArray = [] // Clean the array
            
            return
        }
        
        let currentKeystroke = Keystroke(letter: event.characters!, timestamp: event.timestamp) // Create a new keystroke variable
        timingArray.append(currentKeystroke) // Add it to the array
    }
}
