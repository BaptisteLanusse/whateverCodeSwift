//
//  ViewController.swift
//  testJsonConnectionFromServer
//
//  Created by Lanusse Baptiste on 05/08/2015.
//  Copyright © 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var startTime: NSTimeInterval = 0
    
    var endTime: NSTimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Solution 1: NSURLSession --> Bloque l'application le temps du chargement des données
        
        /*let url = NSURL(string: "http://10.0.1.2:3000/json")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
        }
        
        task!.resume()*/
        
        //Solution 2: NSURLConnection --> S'exécute de manière asynchrone
        
    }
    
    @IBAction func GetDatas(sender: AnyObject) {
        startTime = NSDate.timeIntervalSinceReferenceDate()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        GetAndPrintDatas()
        
    }

    private func GetAndPrintDatas(){
        let url = NSURL(string: "http://10.0.1.2:3000/json")
        
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            
            self.endTime = NSDate.timeIntervalSinceReferenceDate()
            
            let elapsedTime = self.endTime - self.startTime
            
            let firstString = "Finished in : \(elapsedTime)s\n"
            
            let json = JSON(data: data!)
            
            self.textView.text = firstString + json.description
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

