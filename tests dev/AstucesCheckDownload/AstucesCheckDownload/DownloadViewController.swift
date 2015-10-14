//
//  DownloadViewController.swift
//  AstucesCheckDownload
//
//  Created by Lanusse Baptiste on 07/09/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController, NSURLSessionDownloadDelegate, NSURLConnectionDelegate {

    private let url = "http://10.0.1.2:3000/json"
    
    private let urlForCheckingConnection = "http://10.0.1.2:3000/test"
    
    private let uploadUrl = "http://10.0.1.2:3000/send/test"
    
    private var isConnectionOk: Bool = false
    
    private let alertServerDown = UIAlertController(title: "Serveur inaccessible", message: "Impossible d'accéder au serveur. Veuillez vérifier que vous êtes bien connecté au réseau. Si c'est le cas, le serveur est peut être momentanément inaccessible.", preferredStyle: UIAlertControllerStyle.Alert)
    
    private let okAction = UIAlertAction(title: "Ok", style: .Default, handler: {
        action -> Void in
    })
    
    private var session: NSURLSession!
    
    private let fileMgr = NSFileManager.defaultManager()
    
    private var sessionConfiguration: NSURLSessionConfiguration!
    
    private var downloadTask: NSURLSessionDownloadTask!
    
    private let document = "docBPACA.json"
    
    private var path = ""
    
    private let myQueue = NSOperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        alertServerDown.addAction(okAction)
        
        self.sessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.bpaca")
        
        myQueue.maxConcurrentOperationCount = 1
        
        self.session = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: myQueue)
        
        self.downloadTask = self.session.downloadTaskWithURL(NSURL(string: self.url)!)
        
        var error: NSError?
        
        if let dirs: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent(document)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didHitDownloadGenericFile(sender: AnyObject) {
        
        //self.presentViewController(alertServerDown, animated: true, completion: nil)
        
        checkConnection({
            if self.isConnectionOk {
                self.downloadTask.resume()
            } else {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
        })
        
    }
    
    @IBAction func didHitSendFile(sender: AnyObject) {
        
        let url: NSURL? = NSURL(string: uploadUrl)
        let cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        var request = NSMutableURLRequest(URL: url!, cachePolicy: cachePolicy, timeoutInterval: 2.0)
        request.HTTPMethod = "POST"
        
        let boundaryConstant = "Boundary-7MA4YWxkTLLu0UIW"
        let contentType = "multipart/form-data; boundary=" + boundaryConstant
        
        let fileName = self.path.lastPathComponent
        let mimeType = "text/csv"
        let fieldName = "uploadFile"
        
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        var error: NSError?
        
        var dataString = "--\(boundaryConstant)\r\n"
        dataString += "Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n"
        dataString += "Content-Type: \(mimeType)\r\n\r\n"
        dataString += String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &error)!
        dataString += "\r\n"
        dataString += "--\(boundaryConstant)--\r\n"
        
        let requestBodyData = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = requestBodyData
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
            (response, dataObject, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let apiError = error {
                print("something went wrong\r\n")
            } else {
                print("it's fine\r\n")
            }
        })
        
    }
    
    func checkConnection(completion: () -> Void) {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlToCheck: NSURL = NSURL(string: urlForCheckingConnection)!
        
        var message: String = ""
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(urlToCheck) { (data, response, error) in
            message = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
            
            if message == "ok" {
                print("server up")
                println()
                self.isConnectionOk = true
            } else {
                print("server down")
                println()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                self.presentViewController(self.alertServerDown, animated: true, completion: nil)
                self.isConnectionOk = false
            }
            
            completion()
            
        }
        
        task.resume()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        var error: NSError?
        
        if self.fileMgr.fileExistsAtPath(self.path) {
            print("Le fichier existe")
            println()
            if self.fileMgr.removeItemAtPath(self.path, error: &error) {
                print("Le fichier a été supprimé")
                println()
            } else {
                print("Erreur a la destruction: \(error!.localizedDescription)")
                println()
            }
        } else {
            print("Le fichier n'existe pas")
            println()
        }
        
        if self.fileMgr.copyItemAtPath(location.path!, toPath: self.path, error: &error) {
            print("Le fichier a été copié en : " + self.path)
            println()
        } else {
            print("Erreur a la copie: \(error!.localizedDescription)")
            println()
        }
        
        if self.fileMgr.removeItemAtPath(location.path!, error: &error) {
            print("Le fichier en cache a été supprimé")
            println()
        } else {
            print("Erreur a la suppression du cache: \(error!.localizedDescription)")
            println()
        }
        
        if self.fileMgr.fileExistsAtPath(location.path!) {
            print("Problème")
            println()
        } else {
            print("ok, transitionning")
            self.performSegueWithIdentifier("RetourMenu", sender: self)
        }
        
    }
    
    /* Sent periodically to notify the delegate of download progress. */
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print(totalBytesWritten)
        print(" over ")
        print(totalBytesExpectedToWrite)
        println()
    }
    
}
