//
//  GlanceController.swift
//  Chroma Extension
//
//  Created by Omar Alejel on 10/16/15.
//  Copyright © 2015 omar alejel. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet var colorGroup: WKInterfaceGroup!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random() % 255) / 255.0
        let g = CGFloat(arc4random() % 255) / 255.0
        let b = CGFloat(arc4random() % 255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        colorGroup.setBackgroundColor(randomColor())
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
