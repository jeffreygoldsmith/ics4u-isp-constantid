//
//  KeyTiming.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-27.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa
import Foundation

//
// Datatype for processed keystroke patterns.
//
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


//
// Datatype for input keystroke patterns
//
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

var timingArray : [Keystroke] = [] // Array that contains values that will be passed to KeyTiming to be processed upon an enter press
var isDeviant = true // Variable to track user typing consistency


//
// Class to process user typing and determine whether or not the user is typing the password consistently
//
class KeyTiming
{
    var keyDictionary : [String : LetterPattern] = [:] // Array to hold processed password keystrokes
    
    init() {}
    
    func Initialize()
    {
        print("Initializing")
        
        keyDictionary = [:] // Empty array from previous password data
        
        let newLetterPattern = LetterPattern(average: 0, count: 0, standardDeviation: 0, isDeviant: true) // Empty array element
        
        // Iterate over characters in password to create the dictionary
        for character in 0...password.characters.count - 2
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
        let (oldAverage, oldCount, oldStandardDeviation) = getAverageAndCount(letterPattern: letterPattern) // Get previous values
        let newCount = oldCount + 1 // Increment old count to get new count
        
        let keyStrokeFirstDifference = finalTimestamp - initialTimestamp // Find the length of time in between the keystroke
        
        let rangeUpperBound = oldAverage + oldStandardDeviation // Find the upper bound of deviancy
        let rangeLowerBound = oldAverage - oldStandardDeviation // Find the lower bound of deviancy
        
        let isLetterPatternDeviant = (keyStrokeFirstDifference > rangeUpperBound || keyStrokeFirstDifference < rangeLowerBound)
        Swift.print(isLetterPatternDeviant) // Boolean value to track whether or not this keystroke was deviant
        
        let newStandardDeviation = sqrt(((oldStandardDeviation * oldCount) + pow(keyStrokeFirstDifference, 2)) / newCount) // Re-calculated standard deviation value
        let newAverage = (oldAverage * oldCount + keyStrokeFirstDifference) / newCount // Re-calculated average time value
        
        var pattern : LetterPattern
        
        if (enterCount < 2)
        {
            pattern = LetterPattern(average: newAverage, count: newCount, standardDeviation: newStandardDeviation, isDeviant: isLetterPatternDeviant) // LetterPattern value that updates average and standard deviation values
        } else {
            pattern = LetterPattern(average: oldAverage, count: newCount, standardDeviation: oldStandardDeviation, isDeviant: isLetterPatternDeviant) // LetterPattern that does not update average and standard deviation values
        }
        
        return pattern
    }
    
    
    //
    // Function to overwrite the old letter pattern with the new one.
    //
    func setNewLetterPattern(timingArray: [Keystroke])
    {
        // Iterate through the array of key presses
        for i in 0...timingArray.count - 2
        {
            let letterPattern = "\(timingArray[i].letter)-\(timingArray[i + 1].letter)" // Create letter pattern string to index keyDictionary
            let newLetterPattern = getNewLetterPattern(letterPattern: letterPattern, initialTimestamp: timingArray[i].timestamp, finalTimestamp: timingArray[i + 1].timestamp) // Get the new letter pattern to overwrite the old one
            keyDictionary[letterPattern] = newLetterPattern // Overwrite the old pattern with the new one
            
            // If one of the letters has been typed inconsistently
            if ((keyDictionary[letterPattern]?.isDeviant)! == true)
            {
                isDeviant = true // We say that the user has typed the entire word inconsistently
            }
        }

        Swift.print("You typed the word \(isDeviant ? "inconsistently" : "consistently")") // Log
    }
}
