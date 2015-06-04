//
//  CustomImageView.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 24/01/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
  
  let progressIndicatorView = CircularLoaderView(frame: CGRectZero)
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    addSubview(self.progressIndicatorView)
    progressIndicatorView.frame = bounds
    progressIndicatorView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
    
    let url = NSURL(string: "http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg")
    sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly, progress: {
      [weak self]
      (receivedSize, expectedSize) -> Void in
      self!.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
      }) {
        [weak self]
        (image, error, _, _) -> Void in
        self!.progressIndicatorView.reveal()
    }
  }
  
}
