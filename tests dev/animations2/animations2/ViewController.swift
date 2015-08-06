//
//  ViewController.swift
//  animations2
//
//  Created by Lanusse Baptiste on 06/08/2015.
//  Copyright © 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*let container = UIView()
    
    let redSquare = UIView()
    
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.container.frame = CGRect(x: 60, y: 60, width: self.view.bounds.width - 120, height: self.view.bounds.width - 120)
        self.view.addSubview(container)
        
        self.redSquare.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width - 120, height: self.view.bounds.width - 120)
        self.blueSquare.frame = self.redSquare.frame
        
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        self.container.addSubview(self.redSquare)
        
    }

    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        var views : (frontView: UIView, backView: UIView)
        
        if((self.redSquare.superview) != nil){
            views = (frontView: self.redSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }*/
    
    /*let fish = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fish.image = UIImage(named: "blue-fish.png")
        fish.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        self.view.addSubview(fish)
        
    }
    
    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        let fullRotation = CGFloat(M_PI * 2)
        
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.CalculationModePaced
        
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.fish.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.fish.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.fish.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })
            
            }, completion: { finished in
                
        })
    }*/

    /*let fishTab = ["blue-fish.png", "yellow-fish.png", "red-fish.png", "green-fish.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backGroundView = UIImageView()
        backGroundView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 50)
        backGroundView.image = UIImage(named: "back.png")
        
        self.view.addSubview(backGroundView)
        
    }
    
    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        for _ in 0...5 {
            
            let size = CGFloat(arc4random_uniform(60)+60)
            
            // create a square
            let square = UIImageView()
            square.frame = CGRect(x: 55, y: 300, width: size, height: size)
            square.image = UIImage(named: fishTab[Int(arc4random_uniform(4))])
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( arc4random_uniform(150))
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
            path.addCurveToPoint(CGPoint(x: self.view.bounds.width, y: 239 + randomYOffset), controlPoint1: CGPoint(x: self.view.bounds.width / 3, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 2 * self.view.bounds.width / 3, y: 110 + randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = Double(480 / size)
            anim.timeOffset = Double(arc4random_uniform(290))
            
            // add the animation 
            square.layer.addAnimation(anim, forKey: "animate position along path")
        }
        
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        // set up some values to use in the curve
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(self.view.bounds.width / 2 - 62.5, 58.5, 125, 125)
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
            radius: CGRectGetWidth(ovalRect) / 2,
            startAngle: ovalStartAngle,
            endAngle: ovalEndAngle, clockwise: true)
        
        // create an object that represents how the curve
        // should be presented on the screen
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.blueColor().CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen
        self.view.layer.addSublayer(progressLine)
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

