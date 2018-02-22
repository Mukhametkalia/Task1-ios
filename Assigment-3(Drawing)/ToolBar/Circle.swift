//
//  Circle.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class Circle : Tools{
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
    func getCircleRadius()-> CGFloat{
        let dx = pow( Double((end_point?.x)! - (initial_point?.x)!) , 2 )
        let dy = pow( Double((end_point?.y)! - (initial_point?.y)!) , 2 )
        return CGFloat(pow(  dx + dy, 0.5)/2)
    }
    func getCircleCenter()->CGPoint{
        let center_x = (Double((initial_point?.x)!) + Double((end_point?.x)!))/2
        let center_y = (Double((initial_point?.y)!) + Double((end_point?.y)!))/2
        return CGPoint(x: center_x, y: center_y)
    }
    override func getBezierPath()->UIBezierPath{
        path = UIBezierPath(arcCenter: getCircleCenter(), radius: getCircleRadius(), startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
    
        color?.set()
        return path!
    }
    override var IsFilled:Bool{
        get{return isFilled!}
        set{isFilled = newValue}
    }
}
