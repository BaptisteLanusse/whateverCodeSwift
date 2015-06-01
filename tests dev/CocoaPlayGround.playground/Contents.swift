//: Playground - noun: a place where people can play

import Cocoa

//show calculations over any kind of numbers
for count in 0...100 {
    sin(1000.0 / Double(count))
}

//show an image
var codeSchoolImage = NSImage(named: "code-school.png")

//Apply an image filter
let monochromeFilter = CIFilter(name: "CIColorMonochrome")
let inputCIImage = CIImage(data: codeSchoolImage?.TIFFRepresentation)

monochromeFilter.setValue(inputCIImage, forKey:kCIInputImageKey)
monochromeFilter.setValue(CIColor(red: 0.5, green: 0.5, blue: 0.5), forKey:kCIInputColorKey)
monochromeFilter.setValue(1.0, forKey: kCIInputIntensityKey)

let outputCIImage = monochromeFilter.outputImage