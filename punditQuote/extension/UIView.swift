//
//  UIView.swift
//  punditQuote
//
//  Created by Mac on 24/10/2023.
//

import UIKit

extension UIView {

  // OUTPUT 1
    func dropShadow() {
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.masksToBounds = false
    
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

}
