//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
        var parseError: NSError?
        
        do {
            let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.AllowFragments)
            
            if let topApps = parsedObject as? NSDictionary {
                if let feed = topApps["feed"] as? NSDictionary {
                    if let apps = feed["entry"] as? NSArray {
                        if let firstApp = apps[0] as? NSDictionary {
                            if let imname = firstApp["im:name"] as? NSDictionary {
                                if let appName = imname["label"] as? NSString {
                                    print("Optional Binding: \(appName)")
                                }
                            }
                        }
                    }
                }
            }
            
        } catch {
            print("erreur en parsant les données")
        }
    }*/
    
    DataManager.getTopAppsDataFromFileWithSuccess{ (data) -> Void in
        let json = JSON(data: data)
        if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
            print("SwiftJSON: \(appName)")
        }
        
        print(json["feed"]["entry"])
        
    }
    
  }
}

