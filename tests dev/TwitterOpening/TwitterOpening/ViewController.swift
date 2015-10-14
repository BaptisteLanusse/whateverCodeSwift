//
//  ViewController.swift
//  TwitterOpening
//
//  Created by Lanusse Baptiste on 27/08/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button: HamburgerButton! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.button = HamburgerButton(frame: CGRectMake(self.view.bounds.width / 2 - 27, self.view.bounds.height / 4 - 27, 54, 54))
        self.button.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func toggle(sender: AnyObject) {
        self.button.showsMenu = !self.button.showsMenu
    }

}

