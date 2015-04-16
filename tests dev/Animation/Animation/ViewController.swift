import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buckysButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create animation block to fade out
        UIView.animateWithDuration(3.0, animations: {
            let grow = CGAffineTransformMakeScale(4,4)
            let angle = CGFloat(40)
            let rotate = CGAffineTransformMakeRotation(angle)
            
            self.buckysButton.transform = CGAffineTransformConcat(grow, rotate)
            
        })
        
    }
}

