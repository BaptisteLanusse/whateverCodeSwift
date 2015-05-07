//
//  FourthViewController.swift
//  CustomSegues
//
//  Created by Lanusse Baptiste on 24/04/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFirstViewController(){
        self.performSegueWithIdentifier("idThirdSegueUnwind", sender: self)
    }

}
