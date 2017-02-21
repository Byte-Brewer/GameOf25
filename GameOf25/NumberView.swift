//
//  NumberView.swift
//  GameOf25
//
//  Created by Nazar on 19.02.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit

//@IBDesignable
class NumberView: UIButton {
    
    var hightWight: CGSize {
        get {
            return CGSize(width: bounds.width / 7 , height: bounds.width / 7)
        }
    }
    var pointOne: CGPoint {
        get {
            return CGPoint(x: bounds.width / 3 , y: bounds.height / 3)
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       // frame = CGRect(origin: pointOne, size: hightWight)
        titleLabel?.text = "Hello World"
        titleLabel?.textAlignment = .justified
        layer.cornerRadius = 20
        backgroundColor = UIColor.black
    
        // Drawing code
    }
    
    
}
