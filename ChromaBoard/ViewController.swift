
//  ViewController.swift
//  ChromaBoard
//
//  Created by Omar Alejel on 1/29/15.
//  Copyright (c) 2015 omar alejel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var red: Float = 1
    var green: Float = 1
    var blue: Float = 1
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("saveData"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        if let object = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchivePath()) {
            if let colors = object as? NSArray {
                red = Float(colors[0] as! NSNumber)
                green = Float(colors[1] as! NSNumber)
                blue = Float(colors[2] as! NSNumber)
                
                redLabel.text = "\(red)"
                greenLabel.text = "\(green)"
                blueLabel.text = "\(blue)"
                
                redSlider.value = red
                greenSlider.value = green
                blueSlider.value = blue
                
                changeBackgroundColor()
            }
        }
    }
    
    @IBAction func redSliderMoved(sender: UISlider) {
        red = sender.value
        redLabel.text = "\(red)"
        changeBackgroundColor()
    }
    @IBAction func greenSliderMoved(sender: UISlider) {
        green = sender.value
        greenLabel.text = "\(green)"
        changeBackgroundColor()
    }
    @IBAction func blueSliderChanged(sender: UISlider) {
        blue = sender.value
        blueLabel.text = "\(blue)"
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        let newColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        view.backgroundColor = newColor
    }
    
    func saveData() {
        let dataArray = [red, green, blue]
        NSKeyedArchiver.archiveRootObject(dataArray, toFile: itemArchivePath())
    }
    
    func itemArchivePath() -> String {
        let documentDirectories = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectory = documentDirectories.first
        
        let x = documentDirectory!.stringByAppendingString("/colors.plist")
        return x
    }
}

