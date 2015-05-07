import UIKit
import CoreLocation

class EntryFormController: UIViewController, UITextFieldDelegate, UITextViewDelegate
{
    let picker = UIImageView(image: UIImage(named: "picker"))
    let feelings = [
        ["title" : "the best", "color" : "#8647b7"],
        ["title" : "really good", "color" : "#4870b7"],
        ["title" : "okay", "color" : "#45a85a"],
        ["title" : "meh", "color" : "#a8a23f"],
        ["title" : "not so great", "color" : "#c6802e"],
        ["title" : "the worst", "color" : "#b05050"]
    ]
    
    @IBOutlet weak var feelingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.frame = CGRect(x: 45, y: 155, width: 286, height: 291)
        picker.alpha = 0
        picker.hidden = true
        picker.userInteractionEnabled = true
        
        var offset = 21
        
        for (index, feeling) in enumerate(feelings)
        {
            let button = UIButton()
            button.frame = CGRect(x: 13, y: offset, width: 260, height: 43)
            button.setTitleColor(UIColor(rgba: feeling["color"]!), forState: .Normal)
            button.setTitle(feeling["title"]!, forState: .Normal)
            button.tag = index
            button.addTarget(self, action: "setMood:", forControlEvents: .TouchUpInside)
            
            picker.addSubview(button)
            
            offset += 44
        }
        
        view.addSubview(picker)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openPicker()
    {
        self.picker.hidden = false
        
        UIView.animateWithDuration(
            0.3,
            animations: {
                self.picker.frame = CGRect(x: 45, y: 155, width: 286, height: 291)
                self.picker.alpha = 1
            },
            completion: { finished in
            }
        )
    }
    
    func closePicker()
    {
        UIView.animateWithDuration(
            0.3,
            animations: {
                self.picker.frame = CGRect(x: 45, y: 155, width: 286, height: 291)
                self.picker.alpha = 0
            },
            completion: { finished in
                if (finished) {
                    self.picker.hidden = true
                }
            }
        )
    }
    
    @IBAction func togglePicker(sender: AnyObject)
    {
        picker.hidden ? openPicker() : closePicker()
    }
    
    @IBAction func setMood(sender: AnyObject)
    {
        feelingButton.tag = sender.tag
        feelingButton.setTitle(sender.currentTitle, forState: .Normal)
        feelingButton.setTitleColor(sender.titleColorForState(.Normal), forState: .Normal)
        
        closePicker()
    }
}