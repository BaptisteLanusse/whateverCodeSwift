//
//  ViewController.swift
//  CircleTransition
//
//  Created by Lanusse Baptiste on 04/06/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func circleTapped(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}

