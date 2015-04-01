import Cocoa
import XCPlayground

var frameRect = NSRect(x: 0, y: 0, width: 300, height: 300)
var view = NSImageView(frame: frameRect)
var dogPictureUrl = NSURL(string: "http://i.imgur.com/kLVE6E9.jpg")

var dogPicture = NSImage(contentsOfURL: dogPictureUrl!)

view.image = dogPicture

XCPShowView("Werk", view)