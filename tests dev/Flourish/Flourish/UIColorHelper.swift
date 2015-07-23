import UIKit

extension UIColor
{
    convenience init(rgba: String)
    {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#")
        {
            let index   = advance(rgba.startIndex, 1)
            let hex     = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            
            if scanner.scanHexLongLong(&hexValue)
            {
                if hex.characters.count == 6
                {
                    red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF) / 255.0
                }
                else if hex.characters.count == 8
                {
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                }
                else
                {
                    print("invalid rgb string, length should be 7 or 9", appendNewline: false)
                }
            }
            else
            {
                print("scan hex error")
            }
        }
        else
        {
            print("invalid rgb string, missing '#' as prefix", appendNewline: false)
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    class func lighten(color: UIColor, percentage: CGFloat = 1.5) -> UIColor
    {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return UIColor(hue: h, saturation: s, brightness: (b * percentage), alpha: a)
    }
}