//
//  FlickrPhotoCell.swift
//  FlickrSearch
//
//  Created by Lanusse Baptiste on 02/06/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class FlickrPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selected = false
    }
    
    override var selected : Bool {
        didSet {
            self.backgroundColor = selected ? themeColor : UIColor.blackColor()
        }
    }
}
