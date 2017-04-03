//
//  BTViewController.swift
//  constantId
//
//  Created by Jeffrey on 2017-04-02.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

class BTViewController: NSViewController, NSTextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }    
    
    @IBAction func confirmButton(_ sender: Any)
    {
        self.view.window?.close()
    }
}
