//
//  KeyTracking.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-23.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

class KeyTracking: NSWindow {
    
    override func keyDown(with event: NSEvent)
    {
        Swift.print(event.characters!)
        Swift.print(event.timestamp)
    }
}
