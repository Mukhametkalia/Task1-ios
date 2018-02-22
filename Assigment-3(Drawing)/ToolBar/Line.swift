//
//  Line.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class Line : Tools {
    private var initial_point: CGPoint?
    private var end_point: CGPoint?
    private var path: UIBezierPath?
    private var color: UIColor?
    private var isFilled: Bool?

    init(_ initial_point:CGPoint, _ end_point:CGPoint, _ point:Point){
        self.initial_point = initial_point
        self.end_point = end_point
        self.color = point.Color
        self.isFilled = point.IsFilled

    }
    override func getBezierPath()->UIBezierPath{
        path = UIBezierPath()
        path?.move(to: initial_point!)
        path?.addLine(to: end_point!)
        color?.set()
        return path!
    }
    override var IsFilled:Bool{
        get{return isFilled!}
        set{isFilled = newValue}
    }
}
