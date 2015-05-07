//
//  ThirdCustomSegue.swift
//  CustomSegues
//
//  Created by Lanusse Baptiste on 24/04/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class ThirdCustomSegue: UIStoryboardSegue {
    override func perform() {
        var firstVCView = sourceViewController.view as UIView!
        var thirdVCView = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdVCView, aboveSubview: firstVCView)
        
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
        thirdVCView.transform = CGAffineTransformRotate(thirdVCView.transform, -18)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            let firstTransform = CGAffineTransformScale(firstVCView.transform, 0.001, 0.001)
            let secondTransform = CGAffineTransformRotate(firstVCView.transform, 18)
            firstVCView.transform = CGAffineTransformConcat(firstTransform, secondTransform)
            }) { (Finished) -> Void in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    thirdVCView.transform = CGAffineTransformIdentity
                    let one = CGAffineTransformScale(thirdVCView.transform, 1, 1)
                    let two = CGAffineTransformRotate(thirdVCView.transform, 0)
                    thirdVCView.transform = CGAffineTransformConcat(one, two)
                    }, completion: { (Finished) -> Void in
                        firstVCView.transform = CGAffineTransformIdentity
                        self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController, animated: false, completion: nil)
                })
        }
    }
}
