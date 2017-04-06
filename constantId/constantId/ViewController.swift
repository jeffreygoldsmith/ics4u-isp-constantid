//
//  ViewController.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-13.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

var password = ""
var cPassword = ""

class ViewController: NSViewController
{
    func checkPasswordValidity(password: String, cPassword: String, button: NSButton)
    {
        (password == cPassword && password != "" && cPassword != "") ? (button.isEnabled = true) : (button.isEnabled = false)
    }
    
    @IBOutlet weak var confirmButton: NSButton!
    @IBAction func enterPassword(_ sender: NSSecureTextField)
    {
        password = sender.stringValue
        
        checkPasswordValidity(password: password, cPassword: cPassword, button: confirmButton)
    }
    
    @IBAction func confirmPassword(_ sender: NSSecureTextField)
    {
        cPassword = sender.stringValue
        
        checkPasswordValidity(password: password, cPassword: cPassword, button: confirmButton)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override var representedObject: Any?
        {
        didSet
        {
            // Update the view, if already loaded.
        }
    }
    
    override func awakeFromNib()
    {
        if self.view.layer != nil
        {
            let charcoal : CGColor = CGColor(red: 0.35, green: 0.38, blue: 0.44, alpha: 1.0)
            self.view.layer?.backgroundColor = charcoal
        }
        
    }
}
