//
//  ViewController.swift
//  AstucesCheckDownload
//
//  Created by Lanusse Baptiste on 03/09/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonDownload: UIButton!
    
    @IBOutlet weak var buttonTraitment: UIButton!
    
    let fileMgr = NSFileManager.defaultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var emplacement = ""
        
        if let dirs: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            emplacement = dir.stringByAppendingPathComponent("docBPACA.json")
        }
        
        if !fileMgr.fileExistsAtPath(emplacement) {
            buttonTraitment.enabled = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

