//
//  InterfaceController.swift
//  Chroma Extension
//
//  Created by Omar Alejel on 10/16/15.
//  Copyright © 2015 omar alejel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var colorButton: WKInterfaceButton!
    @IBOutlet var redSlider: WKInterfaceSlider!
    @IBOutlet var greenSlider: WKInterfaceSlider!
    @IBOutlet var blueSlider: WKInterfaceSlider!
    
    @IBOutlet var picker: WKInterfacePicker!
    var red: CGFloat = 0.5
    var green: CGFloat = 0.5
    var blue: CGFloat = 0.5
    
    var lastMoved = 0
    
    var allowScroll = true
    
    @IBAction func pickerMoved(value: Int) {
        if allowScroll {
            colorButton.setTitle(String(value))
            let f = Float(value) / 255
            switch lastMoved {
            case 0:
                redSlider.setValue(f)
                setR(f)
            case 1:
                greenSlider.setValue(f)
                setG(f)
            case 2:
                blueSlider.setValue(f)
                setB(f)
            default:
                redMoved(f)
            }
            colorButton.setTitle("scrolled?")
        }

    }
    
    @IBAction func redMoved(value: Float) {
        
        lastMoved = 0
        setR(value)
        allowScroll = false
        picker.setSelectedItemIndex(Int(value * 255))
        picker.focus()
        allowScroll = true
    }
    
    @IBAction func greenMoved(value: Float) {
        lastMoved = 1
        setG(value)
        allowScroll = false
        picker.setSelectedItemIndex(Int(value * 255))
        picker.focus()
        allowScroll = true
        
    }
    
    @IBAction func blueMoved(value: Float) {
        lastMoved = 2
        setB(value)
        allowScroll = false
        picker.setSelectedItemIndex(Int(value * 255))
        picker.focus()
        allowScroll = true
    }
    
    
    
    //these change the color
    
    func setR(value: Float) {
        red = CGFloat(value)
        resetColor()
    }
    
    func setG(value: Float) {
        green = CGFloat(value)
        resetColor()
    }
    
    func setB(value: Float) {
        blue = CGFloat(value)
        resetColor()
    }
    
    func resetColor() {
        colorButton.setBackgroundColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0))
    }
    /////
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        picker.focus()
        let items: [WKPickerItem] = Array(count: 255, repeatedValue: WKPickerItem())
        picker.setItems(items)
        picker.setSelectedItemIndex(122)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
