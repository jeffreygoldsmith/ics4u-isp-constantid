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

var alphabet : [String] = []

class KeyTiming
{
    var keyDictionary : [String : LetterPattern] = [:]
    
    init() {}
    
    func Initialize()
    {
        print("Initializing")
        
        for i in 97...122
        {
            let letter = UnicodeScalar(i)!
            alphabet.append(String(letter))
            alphabet.append(String(letter).uppercased())
        }
        
        alphabet.append("enter")
        alphabet.append("space")
        
        let newLetterPattern = LetterPattern(average: 0, count: 0)
        
        for firstLetter in alphabet
        {
            if (firstLetter != "space" && firstLetter != "enter")
            {
                for secondLetter in alphabet
                {
                    keyDictionary["\(firstLetter)-\(secondLetter)"] = newLetterPattern
                    keyDictionary["\(firstLetter.uppercased())-\(secondLetter)"] = newLetterPattern
                    
                    if (keyDictionary["\(firstLetter.uppercased())-\(secondLetter.uppercased())"] != nil)
                    {
                    
                    } else {
                        keyDictionary["\(firstLetter.uppercased())-\(secondLetter.uppercased())"] = newLetterPattern
                    }
                }
            }
        }
        print(keyDictionary)
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
        for i in 0...timingArray.count - 2 // Iterate through the array of key presses
        {
            let letterPattern = "\(timingArray[i].letter)-\(timingArray[i + 1].letter)"
            let newLetterPattern = getNewLetterPattern(letterPattern: letterPattern, initialTimestamp: timingArray[i].timestamp, finalTimestamp: timingArray[i + 1].timestamp)
            keyDictionary[letterPattern] = newLetterPattern
            
            Swift.print(letterPattern)
            Swift.print(keyDictionary[letterPattern] as Any)
        }
    }
}
