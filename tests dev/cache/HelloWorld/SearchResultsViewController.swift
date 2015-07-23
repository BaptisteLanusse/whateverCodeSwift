//
//  ViewController.swift
//  HelloWorld
//
//  Created by Lanusse Baptiste on 06/07/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {

    @IBOutlet var appsTableView : UITableView?
    
    let kCellIdentifier: String = "SearchResultCell"
    
    var tableData = []
    
    var api = APIController()
    
    var imageCache = [String : UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.api.delegate = self
        
        api.searchItunesFor("Bird")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
        
        let rowData: NSDictionary = self.tableData[indexPath.row] as! NSDictionary
        
        let cellText: String? = rowData["trackName"] as? String
        
        cell.textLabel?.text = cellText
        cell.imageView?.image = UIImage(named: "Blank52")
        
        let formattedPrice: NSString = rowData["formattedPrice"] as! NSString
        
        let urlString: NSString = rowData["artworkUrl60"] as! NSString
        
        var image = self.imageCache[urlString as String]
        
        if (image == nil) {
            let imgURL: NSURL = NSURL(string: urlString as String)!
            
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if error == nil {
                    image = UIImage(data: data)
                    
                    self.imageCache[urlString as String] = image
                    if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath){
                        cellToUpdate.imageView?.image = image
                    }
                }
                else
                {
                    print("Error : \(error.localizedDescription)")
                }
            })
        }
        else {
            dispatch_async(dispatch_get_main_queue(), {
                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                    cellToUpdate.imageView?.image = image
                }
            })
        }
        
        cell.detailTextLabel?.text = formattedPrice as String
        
        return cell
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        let resultsArr: NSArray = results["results"] as! NSArray
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = resultsArr
            self.appsTableView!.reloadData()
        })
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowData: NSDictionary = self.tableData[indexPath.row] as! NSDictionary
        
        let name: String = rowData["trackName"] as! String
        let formattedPrice: String = rowData["formattedPrice"] as! String
        
        let alert: UIAlertView = UIAlertView()
        alert.title = name
        alert.message = formattedPrice
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
}

