import WatchKit
import CoinKit

class CoinGlanceInterfaceController: WKInterfaceController {
    @IBOutlet weak var coinImage: WKInterfaceImage!
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var priceLabel: WKInterfaceLabel!
    
    let helper = CoinHelper()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let favoriteCoin = defaults.stringForKey("favoriteCoin") ?? "DOGE"
        
        let coins = helper.cachedPrices()
        for coin in coins {
            if coin.name == favoriteCoin {
                coinImage.setImageNamed(coin.name)
                nameLabel.setText(coin.name)
                priceLabel.setText("\(coin.price)")
                updateUserActivity("com.razeware.CoinTracker.glance", userInfo: ["coin": coin.name], webpageURL: nil)
                break
            }
        }
    }
}