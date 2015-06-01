//
//  ViewController.swift
//  GestureRecog
//
//  Created by Lanusse Baptiste on 15/05/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var monkeyPan: UIPanGestureRecognizer!
    
    @IBOutlet var bananaPan: UIPanGestureRecognizer!

    var chompPlayer:AVAudioPlayer? = nil
    
    var hehePlayer:AVAudioPlayer? = nil
    
    func loadSound(filename:NSString) -> AVAudioPlayer {
        let url = NSBundle.mainBundle().URLForResource(filename as String, withExtension: "caf")
        var error:NSError? = nil
        let player = AVAudioPlayer(contentsOfURL: url, error: &error)
        if error != nil{
            println("Error loading \(url): \(error?.localizedDescription)")
        } else {
            player.prepareToPlay()
        }
        return player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let filteredSubviews = self.view.subviews.filter({
            $0.isKindOfClass(UIImageView) })
        
        for view in filteredSubviews {
            let recognizer = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
            
            recognizer.delegate = self
            view.addGestureRecognizer(recognizer)
            
            recognizer.requireGestureRecognizerToFail(monkeyPan)
            recognizer.requireGestureRecognizerToFail(bananaPan)
            
            let recognizer2 = TickleGestureRecognizer(target: self, action: Selector("handleTickle:"))
            recognizer2.delegate = self
            view.addGestureRecognizer(recognizer2)
        }
        
        self.chompPlayer = self.loadSound("chomp")
        self.hehePlayer = self.loadSound("hehehe1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(recognizer :UIPanGestureRecognizer){
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
        if recognizer.state == UIGestureRecognizerState.Ended {
            // Figure out the length of the velocity vector
            let velocity = recognizer.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            
            // if the length is < 200 decrease the base speed, otherwise, increase it
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            
            // calculate a final point based on the velocity and slideFactor
            var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                y:recognizer.view!.center.y + (velocity.y * slideFactor))
            
            // Make sure the final point is within the view's bounds
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
            // animate the view to the final resting place.
            UIView.animateWithDuration(Double(slideFactor * 2),
                delay: 0,
                // use ease out animation to slow down movement over time
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {recognizer.view!.center = finalPoint },
                completion: nil)
        }
        return;
    }
    
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer){
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform, recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer){
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func handleTap(recognizer : UITapGestureRecognizer) {
        self.chompPlayer?.play()
    }

    func handleTickle(recognizer : TickleGestureRecognizer){
        self.hehePlayer?.play()
    }
}

