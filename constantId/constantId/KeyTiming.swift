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
    var standardDeviation : Double
    var isDeviant : Bool
    
    init(average: Double, count: Double, standardDeviation: Double, isDeviant: Bool)
    {
        self.average = average
        self.count = count
        self.standardDeviation = standardDeviation
        self.isDeviant = isDeviant
    }
}

var alphabet : [String] = []
var isDeviant = false

class KeyTiming
{
    var keyDictionary : [String : LetterPattern] = [:]
    
    init() {}
    
    func Initialize()
    {
        print("Initializing")
        
        keyDictionary = [:] // Empty array from previous password data
        
        let newLetterPattern = LetterPattern(average: 0, count: 0, standardDeviation: 0, isDeviant: true) // Empty array element
        
        for character in 0...password.characters.count - 2 // Iterate over characters in password to create the dictionary
        {
            keyDictionary["\(password[password.index(password.startIndex, offsetBy: character)])-\(password[password.index(password.startIndex, offsetBy: character + 1)])"] = newLetterPattern
        }
        
        print(keyDictionary) // Log values
        print(keyDictionary.count)
    }
    
    //
    // Function to parce keyDictionary to get the old average and count values.
    //
    func getAverageAndCount(letterPattern: String) -> (Double, Double, Double)
    {
        return ((keyDictionary[letterPattern]?.average)!, (keyDictionary[letterPattern]?.count)!, (keyDictionary[letterPattern]?.standardDeviation)!)
    }
    
    
    //
    // Function to get the new letter pattern that will overwrite the old one in keyDictionary[---].
    //
    func getNewLetterPattern(letterPattern: String, initialTimestamp: Double, finalTimestamp: Double) -> LetterPattern
    {
        let (oldAverage, oldCount, oldStandardDeviation) = getAverageAndCount(letterPattern: letterPattern)
        let newCount = oldCount + 1
        
        let keyStrokeFirstDifference = finalTimestamp - initialTimestamp
        
        let rangeUpperBound = oldAverage + oldStandardDeviation
        let rangeLowerBound = oldAverage - oldStandardDeviation
        
        let isLetterPatternDeviant = (keyStrokeFirstDifference > rangeUpperBound || keyStrokeFirstDifference < rangeLowerBound)
        Swift.print(isLetterPatternDeviant)
        
        let newStandardDeviation = sqrt(((oldStandardDeviation * oldCount) + pow(keyStrokeFirstDifference, 2)) / newCount)
        let newAverage = (oldAverage * oldCount + keyStrokeFirstDifference) / newCount
        
        return (enterCount < 2) ? LetterPattern(average: newAverage, count: newCount, standardDeviation: newStandardDeviation, isDeviant: isLetterPatternDeviant) : LetterPattern(average: oldAverage, count: newCount, standardDeviation: oldStandardDeviation, isDeviant: isLetterPatternDeviant)
    }
    
    
    //
    // Function to overwrite the old letter pattern with the new one.
    //
    func setNewLetterPattern(timingArray: [Keystroke])
    {
        print(timingArray)
        for i in 0...timingArray.count - 2 // Iterate through the array of key presses
        {
            let letterPattern = "\(timingArray[i].letter)-\(timingArray[i + 1].letter)"
            let newLetterPattern = getNewLetterPattern(letterPattern: letterPattern, initialTimestamp: timingArray[i].timestamp, finalTimestamp: timingArray[i + 1].timestamp)
            keyDictionary[letterPattern] = newLetterPattern
            
            // If one of the letters has been typed inconsistently
            if ((keyDictionary[letterPattern]?.isDeviant)! == true)
            {
                isDeviant = true // We say that the user has typed the entire word inconsistently
            }
            
//            Swift.print(letterPattern)
//            Swift.print(keyDictionary[letterPattern] as Any)
        }

        Swift.print("You typed the word \(isDeviant ? "inconsistently" : "consistently")")
    }
}
