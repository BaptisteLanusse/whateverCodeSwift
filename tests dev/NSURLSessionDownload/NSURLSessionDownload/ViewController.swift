//
//  ViewController.swift
//  NSURLSessionDownload
//
//  Created by Lanusse Baptiste on 03/09/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    @IBOutlet weak var textField: UITextView!
    
    var session: NSURLSession!
    
    var downloadView: UIView!
    
    let fileMgr = NSFileManager.defaultManager()
    
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var sessionConfiguration: NSURLSessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.bpaca")
        
        self.session = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
        
        textField.backgroundColor = UIColor.lightGrayColor()
        
        downloadView = UIView(frame: CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 2 - 35, width: self.view.frame.width / 2, height: 70))
        downloadView.backgroundColor = UIColor.whiteColor()
        
        let titleDl = UITextField(frame: CGRect(x: 0, y: 20, width: downloadView.frame.width, height: 30))
        
        titleDl.textAlignment = .Center
        titleDl.text = "Téléchargement en cours"
        
        downloadView.addSubview(titleDl)
        
        self.view.addSubview(downloadView)
        
        var downloadTask: NSURLSessionDownloadTask = self.session.downloadTaskWithURL(NSURL(string: "http://10.0.1.2:3000/json")!)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func URLSession(session: NSURLSession,
        downloadTask:NSURLSessionDownloadTask,
        didFinishDownloadingToURL location: NSURL) {
            
            println()
            print("dowload over")
            println()
            
            let alertDownloadOver = UIAlertController(title: "Téléchargement Terminé", message: "Le téléchargement du fichier demandé est terminé", preferredStyle: UIAlertControllerStyle.Alert)
            alertDownloadOver.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { action in
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                self.textField.backgroundColor = UIColor.clearColor()
                
                self.downloadView.removeFromSuperview()
                
            }))
            
            self.presentViewController(alertDownloadOver, animated: true, completion: nil)
            
            var error: NSError?
            
            var destination = ""
            
            if let dirs: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
                let dir = dirs[0]
                destination = dir.stringByAppendingPathComponent("docBPACA.json")
            }
            
            if fileMgr.fileExistsAtPath(destination) {
                if fileMgr.removeItemAtPath(destination, error: &error) {
                    print("Now you can write")
                    println()
                } else {
                    print("Error")
                    println()
                }
            } else {
                print("File doesn't exist")
                println()
            }
            
            if fileMgr.copyItemAtPath(location.path!, toPath: destination, error: &error) {
                print("File Copied at : " + destination)
                println()
            } else {
                print("Copy failed: \(error!.localizedDescription)")
                println()
            }
            
            if fileMgr.removeItemAtPath(location.path!, error: &error) {
                print("File Removed from origin")
                println()
            } else {
                print("Remove failed: \(error!.localizedDescription)")
                println()
            }
            
            if fileMgr.fileExistsAtPath(location.path!) {
                print("problem")
                println()
            }
            
            if let jsonData = NSData(contentsOfFile: destination, options: .DataReadingMappedIfSafe, error: &error) {
                if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                    
                    print("saved in var")
                    println()
                    
                    if let features: NSArray = jsonResult["features"] as? NSArray {
                        print("keep on")
                        println()
                        print(features.count)
                        println()
                        textField.text = ""
                        var result = ""
                        for feature in features {
                            
                            if let data = NSJSONSerialization.dataWithJSONObject(feature, options: NSJSONWritingOptions.PrettyPrinted, error: nil) {
                                if let string = NSString(data: data, encoding: NSUTF8StringEncoding) {
                                    result += (string as String)
                                }
                            }
                        }
                        print("ok, it's over")
                        println()
                        dispatch_sync(dispatch_get_main_queue()){
                            self.textField.text = result
                        }
                    }
                }
            } else {
                print("Error reading file: \(error!.localizedDescription)")
            }
    }
    
    func URLSession(session: NSURLSession,
        downloadTask: NSURLSessionDownloadTask,
        didWriteData bytesWritten: Int64,
        totalBytesWritten: Int64,
        totalBytesExpectedToWrite: Int64) {
            
            print(totalBytesWritten)
            print(" over ")
            print(totalBytesExpectedToWrite)
            println()
            
    }
    
}

