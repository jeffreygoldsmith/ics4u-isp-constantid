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
        print("Hi")
    }
    @IBAction func testField(_ sender: Any) {
        print("Hi")
    }
    
    
    @IBAction func confirmButton(_ sender: Any)
    {
        self.view.window?.close()
    }
}
