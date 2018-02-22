//
//  ColorSettings.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 10.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
class ColorSettings: UIViewController {
    var controller: ViewController?
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var alpha: UISlider!
    
    @IBAction func colorMix(_ sender: UISlider) {
        let redValue =  CGFloat(self.red.value)
        let greenValue = CGFloat(self.green.value)
        let blueValue = CGFloat(self.blue.value)
        let alphaValue = CGFloat(self.alpha.value)
        color.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        controller?.point.Color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    @IBAction func fontWidth(_ sender: UISlider) {
        controller?.point.BSize = CGFloat(sender.value)
    }
}
