//
//  TraitementViewController.swift
//  AstucesCheckDownload
//
//  Created by Lanusse Baptiste on 07/09/2015.
//  Copyright (c) 2015 BPACA. All rights reserved.
//

import UIKit

class TraitementViewController: UIViewController {

    private let document = "docBPACA.json"
    
    private var path = ""
    
    private let fileMgr = NSFileManager.defaultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let dirs: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent(self.document)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didHitRemoveFile(sender: AnyObject) {
        var error: NSError?
        
        if self.fileMgr.fileExistsAtPath(self.path) {
            print("Le fichier existe")
            println()
            if fileMgr.removeItemAtPath(self.path, error: &error) {
                print("Fichier supprimé")
                println()
            } else {
                print("Erreur lors de la supression: \(error!.localizedDescription)")
                println()
            }
        } else {
            print("Le Fichier n'existe pas")
            println()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
