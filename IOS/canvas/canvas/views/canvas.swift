//
//  canvas.swift
//  canvas
//
//  Created by 김예림 on 2023/08/19.
//

import UIKit

class Canvas: UIView {
    
    // public function
    func undo(){
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        // custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        { return }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.round)
        
        lines.forEach{ (line) in
            for(i,p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                }else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    //track the finger as we move across screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
}