import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        } else if sender.identifier == "idSecondSegueUnwind" {
            self.lblMessage.text = "Welcome back!"
        } else {
            self.lblMessage.text = "Whatcha doing here?"
        }
    }
    
    @IBAction func showThirdViewController(sender: AnyObject){
        self.performSegueWithIdentifier("idSecondSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        var downSwipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFourthViewController")
        downSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSecondViewController(){
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }
    
    func showFourthViewController(){
        self.performSegueWithIdentifier("idThirdSegue", sender: self)
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
            else if id == "idSecondSegueUnwind" {
                let unwindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
            else if id == "idThirdSegueUnwind" {
                let unwindSegue = ThirdCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegue" {
            let secondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.message = "Hello from the 1st View Controller"
        }
    }

}

