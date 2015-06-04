//
//  ViewController.swift
//  CALayerPlayground
//
//  Created by Lanusse Baptiste on 04/06/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLayer()
    }

    func setupLayer() {
        l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth = 100.0
        l.borderColor = UIColor.redColor().CGColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        l.contents = UIImage(named: "star")?.CGImage
        l.contentsGravity = kCAGravityCenter
    }
    
    @IBAction func tapGestureRecognized(sender: AnyObject) {
        l.shadowOpacity = l.shadowOpacity == 0.7 ? 0.0 : 0.7
    }
    
    @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = l.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            l.borderWidth -= offset
            l.cornerRadius += (offset / 2.0)
            l.frame = newFrame
        }
    }

}

