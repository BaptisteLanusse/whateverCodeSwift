import UIKit

@IBDesignable

class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true

    override var highlighted:Bool {
        didSet {
            super.highlighted = highlighted
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        var plusPath = UIBezierPath()
        
        plusPath.lineWidth = plusHeight
        
        plusPath.moveToPoint(CGPoint(x: bounds.width / 2 - plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        plusPath.addLineToPoint(CGPoint(x: bounds.width / 2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        if isAddButton {
            plusPath.moveToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 - plusWidth/2 + 0.5))
            
            plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        UIColor.whiteColor().setStroke()
        
        plusPath.stroke()
        
        if self.state == .Highlighted {
            let context = UIGraphicsGetCurrentContext()
            let startColor = UIColor.clearColor()
            let endColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.15)
            let colors = [startColor.CGColor, endColor.CGColor]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorLocations:[CGFloat] = [0.0, 1.0]
            let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
            var startPoint = CGPointZero
            var endPoint = CGPoint(x:0.0, y:self.bounds.height)
            let center = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
            let radius = self.bounds.width/2
            CGContextSetBlendMode(context, kCGBlendModeDarken)
            CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, 0)
        }
    }

}
