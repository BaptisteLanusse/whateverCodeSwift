//
//  CoinDetailInterfaceController.swift
//  CoinTracker
//
//  Created by Lanusse Baptiste on 15/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import WatchKit
import CoinKit

class CoinDetailInterfaceController: WKInterfaceController {
    var coin: Coin!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let favoriteCoinKey = "favoriteCoin"
    
    @IBOutlet weak var coinImage: WKInterfaceImage!
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    @IBOutlet weak var favoriteSwitch: WKInterfaceSwitch!
    
    @IBAction func favoriteSwitchValueChanged(value: Bool) {
        if let coin = coin {
            defaults.removeObjectForKey(favoriteCoinKey)
            
            if value {
                defaults.setObject(coin.name, forKey: favoriteCoinKey)
            }
            
            defaults.synchronize()
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let coin = context as? Coin {
            self.coin = coin
            setTitle(coin.name)
            NSLog("\(self.coin)")
            coinImage.setImageNamed(coin.name)
            nameLabel.setText(coin.name)
            let titles = ["Current Price", "Yesterday's Price", "Volume"]
            let values = ["\(coin.price) USD", "\(coin.price24h) USD", String(format: "%.4f", coin.volume)]
            
            table.setNumberOfRows(titles.count, withRowType: "CoinRow")
            
            for i in 0..<titles.count {
                if let row = table.rowControllerAtIndex(i) as? CoinRow {
                    row.titleLabel.setText(titles[i])
                    row.detailLabel.setText(values[i])
                }
            }
            
            if let favoriteCoin = defaults.stringForKey(favoriteCoinKey) {
                favoriteSwitch.setOn(favoriteCoin == coin.name)
            }
        }
    }
}
