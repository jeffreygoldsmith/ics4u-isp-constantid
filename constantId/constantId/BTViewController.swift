//
//  BTViewController.swift
//  constantId
//
//  Created by Jeffrey on 2017-04-02.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

class BTViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func enterPassword(_ sender: Any) {
        print("Enter password")
    }
    
    @IBAction func confirmPassword(_ sender: Any) {
        print("Confirm password")
    }
    
    
    @IBAction func confirmButton(_ sender: Any)
    {
        self.view.window?.close()
    }
}
