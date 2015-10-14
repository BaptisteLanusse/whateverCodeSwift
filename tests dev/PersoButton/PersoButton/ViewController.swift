//
//  ViewController.swift
//  PersoButton
//
//  Created by Lanusse Baptiste on 27/08/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button: HamburgerButton! = nil
    
    var slider: SpringySlider! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.button = HamburgerButton(frame: CGRectMake(self.view.bounds.width / 2 - 27, self.view.bounds.height / 4 - 27, 54, 54))
        self.button.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        
        let width = self.view.bounds.width - 120
        
        self.slider = SpringySlider(frame: CGRectMake(self.view.bounds.width / 2 - width / 2, 2 * self.view.bounds.height / 4 - 27, width, 54))
        
        self.view.addSubview(button)
        
        self.view.addSubview(slider)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    func toggle(sender: AnyObject) {
        self.button.showsMenu = !self.button.showsMenu
    }

}

