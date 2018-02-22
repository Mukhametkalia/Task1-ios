//
//  Point.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class Point{
    private var color: UIColor = UIColor.black
    private var isFilled: Bool = true
    private var bSize: CGFloat = 3
    init(_ color: UIColor, _ isFilled: Bool , _ bSize: CGFloat){
        self.color = color
        self.isFilled = isFilled
        self.bSize = bSize
    }
    var Color: UIColor{
        get{return color}
        set{color = newValue}
    }
    var IsFilled: Bool{
        get{return isFilled}
        set{isFilled = newValue}
    }
    var BSize: CGFloat{
        get{return bSize}
        set{bSize = newValue}
    }
}
