//
//  ViewController.swift
//  iosNotification
//
//  Created by Lanusse Baptiste on 25/06/2015.
//  Copyright © 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "Woww it works!!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 30)
        localNotification.category = "INVITE_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

