//
//  InstrumentsUsingModel.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 11.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
public class ToolsUsingModel{
    private var Tool: Dictionary<Int,String> = [
        0:"Triangle",
        1:"Rectangle",
        2:"Circle",
        3:"Pen",
        4:"Line"
    ]
    func whichTool(_ index:Int)->String{
        return Tool[index]!
    }
    private var initial_point:CGPoint?
    private var end_point: CGPoint?
    private var point: Point?
    init(_ initial_point:CGPoint, _ end_point:CGPoint, _ point:Point){
        self.initial_point = initial_point
        self.end_point = end_point
        self.point = point
    }
    func  whichToolCalled(_ index: Int) -> Tools{
        if whichTool(index) == "Circle"{
            return Circle(initial_point!, end_point!, point! )
        }else if whichTool(index) == "Rectangle"{
            return Rectangle(initial_point!, end_point!,point!)
        }else if whichTool(index) == "Line"{
            return Line(initial_point!, end_point!, point!)
        }else if whichTool(index) == "Triangle"{
            return Triangle(initial_point!, end_point!, point!)
        }else if whichTool(index) == "Pen"{
            return Pen(initial_point!, end_point!, point!)
        }
        else{
            return Pen(initial_point!, end_point!, point!)
        }
    }
}
