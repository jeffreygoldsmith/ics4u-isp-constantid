//
//  VerifiedSecureTextField.swift
//  constantId
//
//  Created by Jeffrey on 2017-04-03.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

var passwordValue = ""

class VerifiedSecureTextField: NSSecureTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func textDidChange(_ notification: Notification) {
        Swift.print(self.stringValue)
        passwordValue = self.stringValue
    }
}
