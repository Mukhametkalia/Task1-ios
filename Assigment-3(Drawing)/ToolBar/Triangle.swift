//
//  Triangle.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class Triangle : Tools {
    private var initial_point:CGPoint?
    private var end_point: CGPoint?
    private var path:UIBezierPath?
    private var color: UIColor?
    private var isFilled:Bool?

    init(_ initial_point:CGPoint, _ end_point:CGPoint, _ point:Point){
        self.initial_point = initial_point
        self.end_point = end_point
        self.color = point.Color
        self.isFilled = point.IsFilled
    }
    func getTriangleLength()-> CGFloat{
        let dx = pow( Double((end_point?.x)! - (initial_point?.x)!) , 2 )
        let dy = pow( Double((end_point?.y)! - (initial_point?.y)!) , 2 )
        return CGFloat(pow( (dx + dy), 0.5))
    }
    override func getBezierPath()->UIBezierPath{
        path = UIBezierPath()
        path?.move(to: CGPoint(x: ((initial_point?.x)!+(end_point?.x)!)/2, y: (initial_point?.y)!))
        path?.addLine(to: end_point!)
        path?.addLine(to: CGPoint(x: (initial_point?.x)!, y: (end_point?.y)!))
        path?.close()
        return path!
    }
    override var IsFilled:Bool{
        get{return isFilled!}
        set{isFilled = newValue}
    }
}
