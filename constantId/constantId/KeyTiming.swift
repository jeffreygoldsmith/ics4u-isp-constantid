//
//  KeyTiming.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-27.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa
import Foundation

struct LetterPattern
{
    var average : Double
    var count : Double
    
    init(average: Double, count: Double)
    {
        self.average = average
        self.count = count
    }
}

let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "space" ]
var keyDictionary : [String : LetterPattern] = [:]

class KeyTiming
{
    init()
    {
        print("Initializing")
        for firstLetter in alphabet
        {
            for secondLetter in alphabet
            {
                let newLetterPattern = LetterPattern(average: 0, count: 0)
                keyDictionary["\(firstLetter)-\(secondLetter)"] = newLetterPattern
            }
        }
        print(keyDictionary.count)
    }
    
    
    //
    // Function to parce keyDictionary to get the old average and count values.
    //
    func getAverageAndCount(letterPattern: String) -> (Double, Double)
    {
        return ((keyDictionary[letterPattern]?.average)!, (keyDictionary[letterPattern]?.count)!)
    }
    
    
    //
    // Function to get the new letter pattern to overwrite the old one in keyDictionary[---].
    //
    func getNewLetterPattern(letterPattern: String, initialTimestamp: Double, finalTimestamp: Double) -> LetterPattern
    {
        let (oldAverage, oldCount) = getAverageAndCount(letterPattern: letterPattern)
        let newCount = oldCount + 1
        
        let keyStrokeFirstDifference = finalTimestamp - initialTimestamp
        let newAverage = (oldAverage * oldCount + keyStrokeFirstDifference) / newCount
        
        return LetterPattern(average: newAverage, count: newCount)
    }
    
    
    //
    // Function to overwrite the old letter pattern with the new one.
    //
    func setNewLetterPattern(event: NSEvent, timingArray: [Keystroke])
    {
        for i in 0...timingArray.count - 1 // Iterate through the array of key presses
        {
            if (i == timingArray.count - 1)
            {
                let letterPattern = "\(timingArray[i].letter)-space)"
                let newLetterPattern = getNewLetterPattern(letterPattern: letterPattern, initialTimestamp: timingArray[i].timestamp, finalTimestamp: event.timestamp)
                keyDictionary[letterPattern] = newLetterPattern
                
                break
            }
            
            let letterPattern = "\(timingArray[i].letter)-\(timingArray[i + 1].letter)"
            let newLetterPattern = getNewLetterPattern(letterPattern: letterPattern, initialTimestamp: timingArray[i].timestamp, finalTimestamp: timingArray[i + 1].timestamp)
            keyDictionary[letterPattern] = newLetterPattern
            
            Swift.print(letterPattern)
            Swift.print(keyDictionary[letterPattern] as Any)
        }
    }
}
