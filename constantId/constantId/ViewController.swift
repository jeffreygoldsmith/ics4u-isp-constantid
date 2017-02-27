//
//  ViewController.swift
//  constantId
//
//  Created by Jeffrey on 2017-02-13.
//  Copyright © 2017 Jeffrey. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func keyDown(with event: NSEvent) {
        print("test")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func awakeFromNib()
    {
        if self.view.layer != nil
        {
            let color : CGColor = CGColor(red: 0.35, green: 0.38, blue: 0.44, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
        
    }
    
}
