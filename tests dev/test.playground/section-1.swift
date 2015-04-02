// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

/*let blue = NSColor.blueColor()

let r = NSRect(x: 0, y: 0, width: 200, height: 200)

for index in 1...10 {
    index
}*/

class PlayView:NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        
        let blue = NSColor.blueColor()
        
        blue.setFill()
        
        NSRectFill(self.bounds)
        
        var bp = NSBezierPath(ovalInRect: NSInsetRect(self.bounds, 20, 20))
        
        NSColor.redColor().setFill()
        
        bp.fill()
        
    }
    
}

var view = PlayView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))
XCPShowView("PlayView", view)