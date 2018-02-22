//
//  DrawingArea.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 10.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
//protocol UICustomViewDelegate {
//    var paint: Tools{get set}
//}
class DrawingArea: UIView{

    var firstPoint:CGPoint?
    var lastPoint:CGPoint?
    var viewCC: ViewController?
    var indexTool:Int?
    var controllers = [Tools]()
    var controllers1 = [Tools]()
    var swipped:Bool?
    override func draw(_ rect: CGRect){
        if swipped == true && firstPoint != nil{
            for i in controllers{
                if (i.IsFilled){
                    i.getBezierPath().fill()
                }
                i.getBezierPath().stroke()
            }
        }
        else if(firstPoint != nil && swipped == false){
            for i in controllers{
                if (i.IsFilled){
                    i.getBezierPath().fill()
                }
                i.getBezierPath().stroke()
            }
            for i in controllers1{
                if (i.IsFilled){
                    i.getBezierPath().fill()
                }
                i.getBezierPath().stroke()
            }
            if controllers1.count>0{
                controllers1.removeAll()
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        firstPoint = touches.first?.location(in: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        if swipped == false && firstPoint != nil {
            lastPoint = touches.first?.location(in: self)
            controllers.append((( ToolsUsingModel(firstPoint!, lastPoint!,  (viewCC?.point)! )).whichToolCalled(indexTool!)))
            setNeedsDisplay()
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        if swipped == true{
            let touch = touches.first
            if let point = touch?.location(in: self) {
                lastPoint = point
            }
            controllers.append(Pen(firstPoint!, lastPoint!, (viewCC?.point)! ))
            firstPoint = lastPoint
            setNeedsDisplay()
        }
        else{
            let touch = touches.first
            if let point = touch?.location(in: self) {
                lastPoint = point
            }
            controllers1.append((( ToolsUsingModel(firstPoint!, lastPoint!,  (viewCC?.point)! )).whichToolCalled(indexTool!)))
            setNeedsDisplay()
        }
    }
}
