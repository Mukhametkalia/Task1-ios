//
//  ViewController.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 10.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
class ViewController: UIViewController{
    var point = Point(UIColor.black,false,CGFloat(3))
    @IBOutlet weak var DrawingArea: DrawingArea!


    @IBAction func Colors(_ sender: AnyObject) {
        let colors: [(CGFloat, CGFloat, CGFloat)] = [(1.0, 1.0, 0),
                                                     (102.0 / 255.0, 1.0, 0),
                                                     (102.0 / 255.0, 204.0 / 255.0, 0),
                                                     (1.0, 0, 1.0), (1.0, 0, 0), (0, 0, 1.0),
                                                     (51.0 / 255.0, 204.0 / 255.0, 1.0),
                                                     (1.0, 1.0, 1.0), (1.0, 102.0 / 255.0, 0), (0, 0, 0),
                                                     (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
                                                     (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0)]
        var index = sender.tag ?? 0
        if index < 0 || index >= colors.count {
            index = 0
        }
        (red, green, blue) = colors[index]
        point.Color = UIColor.init(red: colors[index].0, green: colors[index].1, blue: colors[index].2, alpha: 1)
        
    }
    var red: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var green: CGFloat = 0.0
    
    @IBAction func Saving(_ sender: AnyObject) {
        if let image = imageWithView(inView: DrawingArea){
            UIImageWriteToSavedPhotosAlbum(image,nil ,nil , nil)
            
        }
    }
    func imageWithView(inView: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(inView.bounds.size, inView.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            inView.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    @IBAction func reset(_ sender: UIButton) {
        if DrawingArea.controllers.count > 0{
            DrawingArea.controllers.removeLast()
            DrawingArea.setNeedsDisplay()
        }
    }
    @IBAction func figures(_ sender: UIButton) {
        if sender.tag == 3{
            DrawingArea.swipped = true
        }
        else if sender.tag >= 0 && sender.tag != 3{
            DrawingArea.indexTool = sender.tag
            DrawingArea.swipped = false
        }
    }
    @IBAction func Fill(_ sender: UISwitch) {
        point.IsFilled = sender.isOn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DrawingArea.viewCC = self
        DrawingArea.swipped = false
    }

}
