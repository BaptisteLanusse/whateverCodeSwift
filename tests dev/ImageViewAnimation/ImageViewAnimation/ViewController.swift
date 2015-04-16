import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    var imageList:[UIImage] = [UIImage]()
    
    @IBAction func animationButtonClicked(sender: AnyObject) {
        startAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...13{
            let imageName = "\(i)"
            imageList.append(UIImage(named: imageName)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startAnimation() -> Void{
        if !imageView.isAnimating(){
            imageView.animationImages = imageList
            imageView.startAnimating()
            button.setTitle("Stop Animation", forState: UIControlState.Normal)
        }
        else {
            imageView.stopAnimating()
            imageView.image = UIImage(named: "bomb.jpg")!
            button.setTitle("Start Animation", forState: UIControlState.Normal)
        }
    }

}

