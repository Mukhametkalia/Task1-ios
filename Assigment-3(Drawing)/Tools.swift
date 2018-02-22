//
//  View.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 10.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//
import Foundation
import UIKit

public class Tools{
    private var initial_point: CGPoint?
    private var end_point: CGPoint?
    private var color: UIColor?
    private var isFilled:Bool = true
    
    var pathP: UIBezierPath?
    var toString:String?

    func getBezierPath() -> UIBezierPath{
        if isFilled{
            color?.setFill()
        }
        return pathP!
    }
    var IsFilled:Bool{
        get{return isFilled}
        set{isFilled = newValue}
    }
}
