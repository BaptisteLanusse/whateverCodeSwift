//
//  ViewController.swift
//  testJsonConnectionFromServer
//
//  Created by Lanusse Baptiste on 05/08/2015.
//  Copyright © 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {

    @IBOutlet weak var textView: UITextView!
    
    lazy var data = NSMutableData()
    
    var startTime: NSTimeInterval = 0
    
    var endTime: NSTimeInterval = 0
    
    private let url = "http://10.0.1.2:3000/json"
    
    private let urlChecking = "http://10.0.1.2:3000/test"
    
    private var isConnectionOK: Bool = false
    
    private let alertServerDown = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("view did load")
        
        //Solution 1: NSURLSession --> Bloque l'application le temps du chargement des données
        
        /*let url = NSURL(string: "http://10.0.1.2:3000/json")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            self.textView.text = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
        }
        
        task!.resume()*/
        
        //Solution 2: NSURLConnection --> S'exécute de manière asynchrone
        
        alertServerDown.title = "Server unreachable"
        alertServerDown.message = "The server can't be reached, he might be down, or you might not be connected"
        alertServerDown.addButtonWithTitle("Ok")
        
        GetDatas(self)
        
    }
    
    @IBAction func GetDatas(sender: AnyObject) {
        checkConnection() { () in
            print("getting datas")
            
            self.startTime = NSDate.timeIntervalSinceReferenceDate()
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            self.GetAndPrintDatas()
        }
        
    }

    private func GetAndPrintDatas(){
        let url = NSURL(string: "http://10.0.1.2:3000/jsonText")
        
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            
            let json = JSON(data: data!)
            
            self.endTime = NSDate.timeIntervalSinceReferenceDate()
            
            let elapsedTime1 = self.endTime - self.startTime
            
            let timeString1 = "Loaded in : \(elapsedTime1)s\n"
            
            print(timeString1)
            
            self.textView.text = json.description
            
            self.endTime = NSDate.timeIntervalSinceReferenceDate()
            
            let elapsedTime = self.endTime - self.startTime
            
            let timeString = "Finished in : \(elapsedTime)s\n"
            
            print(timeString)
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkConnection(completion: () -> Void) {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlToCheck: NSURL = NSURL(string: urlChecking)!
        
        var message: String = ""
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(urlToCheck) { (data, response, error) in
            message = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
            if message == "ok" {
                print("server is up")
                self.isConnectionOK = true
            } else {
                print("server is down")
                self.isConnectionOK = false
            }
            
            if (self.isConnectionOK) {
                completion()
            } else {
                self.alertServerDown.show()
            }
            
        }
        
        task!.resume()
    }
    
}

