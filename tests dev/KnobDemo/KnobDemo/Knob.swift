//
//  Knob.swift
//  KnobDemo
//
//  Created by Lanusse Baptiste on 25/08/2015.
//  Copyright (c) 2015 Mikael Konutgan. All rights reserved.
//

import UIKit

public class Knob: UIControl {

    private let knobRenderer = KnobRenderer()
    
    func createSublayers() {
        knobRenderer.update(bounds)
        knobRenderer.strokeColor = tintColor
        knobRenderer.startAngle = -CGFloat(M_PI * 11.0 / 8.0)
        knobRenderer.endAngle = CGFloat(M_PI * 3.0 / 8.0)
        knobRenderer.pointerAngle = knobRenderer.startAngle
        knobRenderer.lineWidth = 2.0
        knobRenderer.pointerLength = 6.0
        
        layer.addSublayer(knobRenderer.trackLayer)
        layer.addSublayer(knobRenderer.pointerLayer)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createSublayers()
        
        let gr = RotationGestureRecognizer(target: self, action: "handleRotation:")
        self.addGestureRecognizer(gr)
    }
    
    func handleRotation(sender: AnyObject) {
        let gr = sender as! RotationGestureRecognizer
        
        let midPointAngle = (2.0 * CGFloat(M_PI) + self.startAngle - self.endAngle) / 2.0 + self.endAngle
        
        var boundedAngle = gr.rotation
        if boundedAngle > midPointAngle {
            boundedAngle -= 2.0 * CGFloat(M_PI)
        } else if boundedAngle < (midPointAngle - 2.0 * CGFloat(M_PI)) {
            boundedAngle += 2 * CGFloat(M_PI)
        }
        
        boundedAngle = min(self.endAngle, max(self.startAngle, boundedAngle))
        
        let angleRange = endAngle - startAngle
        let valueRange = maximumValue - minimumValue
        let valueForAngle = Float(boundedAngle - startAngle) / Float(angleRange) * valueRange + minimumValue
        
        self.value = valueForAngle
        
        if continuous {
            sendActionsForControlEvents(.ValueChanged)
        } else {
            if (gr.state == UIGestureRecognizerState.Ended) || (gr.state == UIGestureRecognizerState.Cancelled) {
                sendActionsForControlEvents(.ValueChanged)
            }
        }
    }
    
    public override func tintColorDidChange() {
        knobRenderer.strokeColor = tintColor
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setValue(value: Float, animated: Bool) {
        if value != self.value {
            self.backingValue = min(self.maximumValue, max(self.minimumValue, value))
            
            let angleRange = endAngle - startAngle
            let valueRange = CGFloat(maximumValue - minimumValue)
            let angle = CGFloat(value - minimumValue) / valueRange * angleRange + startAngle
            knobRenderer.setPointerAngle(angle, animated: animated)
        }
    }
    
    private var backingValue: Float = 0.0
    
    public var value: Float {
        get { return backingValue }
        set { setValue(newValue, animated: false) }
    }
    
    public var startAngle: CGFloat {
        get {
            return knobRenderer.startAngle
        }
        set {
            knobRenderer.startAngle = newValue
        }
    }
    
    public var endAngle: CGFloat {
        get {
            return knobRenderer.endAngle
        }
        set {
            knobRenderer.endAngle = newValue
        }
    }
    
    public var lineWidth: CGFloat {
        get {
            return knobRenderer.lineWidth
        }
        set {
            knobRenderer.lineWidth = newValue
        }
    }
    
    public var pointerLength: CGFloat {
        get {
            return knobRenderer.pointerLength
        }
        set {
            knobRenderer.pointerLength = newValue
        }
    }
    
    public var minimumValue: Float = 0.0
    
    public var maximumValue: Float = 1.0
    
    public var continuous = true
    
}


private class KnobRenderer {
    var strokeColor: UIColor {
        get {
            return UIColor(CGColor: trackLayer.strokeColor)!
        }
        
        set(strokeColor) {
            trackLayer.strokeColor = strokeColor.CGColor
            pointerLayer.strokeColor = strokeColor.CGColor
        }
    }
    
    var lineWidth: CGFloat = 1.0 {
        didSet {
            update()
        }
    }
    
    let trackLayer = CAShapeLayer()
    var startAngle: CGFloat = 0.0 {
        didSet {
            update()
        }
    }
    var endAngle: CGFloat = 0.0 {
        didSet {
            update()
        }
    }
    
    let pointerLayer = CAShapeLayer()
    
    var backingPointerAngle: CGFloat = 0.0
    
    var pointerAngle: CGFloat {
        get {
            return backingPointerAngle
        }
        set {
            setPointerAngle(newValue, animated: false)
        }
    }
    
    func setPointerAngle(pointerAngle: CGFloat, animated: Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        pointerLayer.transform = CATransform3DMakeRotation(pointerAngle, 0.0, 0.0, 0.1)
        
        if animated {
            let midAngle = (max(pointerAngle, self.pointerAngle) - min(pointerAngle, self.pointerAngle)) / 2.0 + min(pointerAngle, self.pointerAngle)
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            animation.duration = 0.25
            
            animation.values = [self.pointerAngle, midAngle, pointerAngle]
            animation.keyTimes = [0.0, 0.5, 1.0]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            pointerLayer.addAnimation(animation, forKey: nil)
        }
        
        CATransaction.commit()
        
        self.backingPointerAngle = pointerAngle
    }
    
    var pointerLength: CGFloat = 0.0 {
        didSet {
            update()
        }
    }
    
    init() {
        trackLayer.fillColor = UIColor.clearColor().CGColor
        pointerLayer.fillColor = UIColor.clearColor().CGColor
    }
    
    func updateTrackLayerPath(){
        let arcCenter = CGPoint(x: trackLayer.bounds.width / 2.0, y: trackLayer.bounds.height / 2.0)
        let offset = max(pointerLength, trackLayer.lineWidth / 2.0)
        let radius = min(trackLayer.bounds.height, trackLayer.bounds.width) / 2.0 - offset
        trackLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
    }
    
    func updatePointerLayerPath() {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: pointerLayer.bounds.width - pointerLength - pointerLayer.lineWidth / 2.0, y: pointerLayer.bounds.height / 2.0))
        path.addLineToPoint(CGPoint(x: pointerLayer.bounds.width, y: pointerLayer.bounds.height / 2.0))
        pointerLayer.path = path.CGPath
    }
    
    func update() {
        trackLayer.lineWidth = lineWidth
        pointerLayer.lineWidth = lineWidth
        
        updateTrackLayerPath()
        updatePointerLayerPath()
    }
    
    func update(bounds: CGRect) {
        let position = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        
        trackLayer.bounds = bounds
        trackLayer.position = position
        
        pointerLayer.bounds = bounds
        pointerLayer.position = position
        
        update()
    }
    
}

import UIKit.UIGestureRecognizerSubclass

private class RotationGestureRecognizer: UIPanGestureRecognizer {
    var rotation: CGFloat = 0.0
    
    override func touchesBegan(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        super.touchesBegan(touches, withEvent: event)
        
        updateRotationWithTouches(touches)
    }
    
    override func touchesMoved(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        super.touchesMoved(touches, withEvent: event)
        
        updateRotationWithTouches(touches)
    }
    
    func updateRotationWithTouches(touches: Set<NSObject>) {
        if let touch = touches[touches.startIndex] as? UITouch {
            self.rotation = rotationForLocation(touch.locationInView(self.view))
        }
    }
    
    func rotationForLocation(location: CGPoint) -> CGFloat {
        let offset = CGPoint(x: location.x - view!.bounds.midX, y: location.y - view!.bounds.midY)
        return atan2(offset.y, offset.x)
    }
    
    override init(target: AnyObject, action: Selector) {
        super.init(target: target, action: action)
        
        minimumNumberOfTouches = 1
        maximumNumberOfTouches = 1
    }
    
}