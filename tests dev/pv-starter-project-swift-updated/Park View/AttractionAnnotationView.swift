import UIKit
import MapKit

class AttractionAnnotationView: MKAnnotationView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let attractionAnnotation = self.annotation as! AttractionAnnotation
        switch (attractionAnnotation.type) {
        case .AttractionFirstAid:
            image = UIImage(named: "firstaid")
        case .AttractionFood:
            image = UIImage(named: "food")
        case .AttractionRide:
            image = UIImage(named: "ride")
        default:
            image = UIImage(named: "star")
        }
    }
}