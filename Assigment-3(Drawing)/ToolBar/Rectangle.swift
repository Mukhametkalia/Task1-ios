//
//  Rectangle.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class Rectangle : Tools {
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
    func getRectangleInitial()-> CGPoint{
        return CGPoint(x:  min(Double((initial_point?.x)!) , Double((end_point?.x)!)), y: min(Double((initial_point?.y)!) , Double((end_point?.y)!)))
    }
    func getRectangleSize()->CGSize{
        let dx = pow( Double((end_point?.x)! - (initial_point?.x)!) , 2 )
        let dy = pow( Double((end_point?.y)! - (initial_point?.y)!) , 2 )
        
        let size = pow( (dx + dy)/2 ,0.5)
        return CGSize(width: size, height: size)
    }
    override func getBezierPath()->UIBezierPath{
        let rect = CGRect(origin: getRectangleInitial(), size: getRectangleSize())
        path = UIBezierPath(rect: rect)
   
        color?.set()
        return path!
    }
    override var IsFilled:Bool{
        get{return isFilled!}
        set{isFilled = newValue}
    }
}
