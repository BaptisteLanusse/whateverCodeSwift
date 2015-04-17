import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    var message: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        lblMessage.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFirstViewController(){
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegueUnwind" {
            let firstViewController = segue.destinationViewController as! ViewController
            firstViewController.lblMessage.text = "You just came back from the 2nd VC"
        }
    }
    
}
