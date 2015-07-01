//
//  ScrollViewContainer.swift
//  ScrollViews
//
//  Created by Lanusse Baptiste on 01/07/2015.
//  Copyright (c) 2015 Lanusse Baptiste. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {

    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, withEvent: event)
        if let theView = view {
            if theView == self {
                return scrollView
            }
        }
        return view
    }

}
