//
//  experienceBarView.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 12/1/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData


@IBDesignable class experienceBarView: UIView {

    //@IBInspectable var level = 1
    var z = 1
    var bros = [NSManagedObject]()
    @IBInspectable var counterTotal: Int = 5
    @IBInspectable var counter: Int = 0 {
        didSet {
            if z > -1 {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        CGContextSetLineWidth(context, 4.0)
//        CGContextSetStrokeColorWithColor(context,
//            UIColor.blueColor().CGColor)
//        let rectangle = CGRectMake(12,170,200,80)
//        CGContextAddRect(context, rectangle)
//        CGContextStrokePath(context)
//        CGContextSetFillColorWithColor(context,
//            UIColor.redColor().CGColor)
//        CGContextFillRect(context, rectangle)
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
