//
//  TriangleView.swift
//  Truvs
//
//  Created by Luiz Fernando França on 10/3/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

import UIKit

class TriangleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let ctx : CGContext = UIGraphicsGetCurrentContext()!
        
        ctx.beginPath()
        
        ctx.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        ctx.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        ctx.addLine(to: CGPoint(x: rect.maxX/2.0, y: rect.minY))
        
        ctx.closePath()
        
        ctx.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60);
        ctx.fillPath();
    }
    
    
}
