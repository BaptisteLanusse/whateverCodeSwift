//
//  InterfaceController.swift
//  BitWatch WatchKit Extension
//
//  Created by Lanusse Baptiste on 15/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation
import BitWatchKit

class InterfaceController: WKInterfaceController {

    let tracker = Tracker()
    var updating = false
    
    @IBOutlet weak var image: WKInterfaceImage!
    
    @IBOutlet weak var lastUpdatedLabel: WKInterfaceLabel!
    
    private func updatePrice(price: NSNumber) {
        priceLabel.setText(Tracker.priceFormatter.stringFromNumber(price))
    }
    
    private func update() {
        if !updating {
            updating = true
            
            let originalPrice = tracker.cachedPrice()
            
            tracker.requestPrice {
                (price, error) -> () in
                if error == nil {
                    self.updatePrice(price!)
                    self.updateDate(NSDate())
                    self.updateImage(originalPrice, newPrice: price!)
                }
                self.updating = false
            }
        }
    }
    
    private func updateDate(date: NSDate) {
        self.lastUpdatedLabel.setText("Last Updated \(Tracker.dateFormatter.stringFromDate(date))")
    }
    
    private func updateImage(originalePrice: NSNumber, newPrice: NSNumber) {
        if originalePrice.isEqualToNumber(newPrice) {
            image.setHidden(true)
        } else {
            if newPrice.doubleValue > originalePrice.doubleValue {
                image.setImageNamed("Up")
            } else {
                image.setImageNamed("Down")
            }
            image.setHidden(false)
        }
    }
    
    @IBOutlet weak var priceLabel: WKInterfaceLabel!
    
    @IBAction func refreshTapped() {
        update()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        updatePrice(tracker.cachedPrice())
        
        image.setHidden(true)
        updateDate(tracker.cachedDate())
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        update()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
