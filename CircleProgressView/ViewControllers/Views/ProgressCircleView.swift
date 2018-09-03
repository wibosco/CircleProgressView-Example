//
//  ProgressCircleView.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressCircleView: UIView {

    @IBInspectable var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var trackColor: UIColor = UIColor.lightGray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var progressColor: UIColor = UIColor.darkGray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor.clear
    }
    
    // MARK: - InterfaceBuilder
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        commonInit()
    }
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        guard let contextRef = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let circleRect = CGRect(x: lineWidth/2, y: lineWidth/2, width: frame.size.width - lineWidth, height: frame.size.height - lineWidth)
        
        contextRef.clear(circleRect)
        
        // inner loading circle is 100% of background circle
        let radius = circleRect.size.width/2
        let center = CGPoint(x: (circleRect.size.width/2)+(lineWidth/2), y: (circleRect.size.height/2)+(lineWidth/2))
        
        // draw track circle stroke
        contextRef.setLineWidth(lineWidth)
        contextRef.addArc(center: center, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        contextRef.setStrokeColor(trackColor.cgColor)
        contextRef.strokePath()
        
        // draw progress starting at 0%.
        // must subtract pi/2 to transform starting position to top of circle
        let finalDegree = (progress * (2*CGFloat.pi)) - (CGFloat.pi/2)
        
        contextRef.setLineWidth(lineWidth)
        contextRef.addArc(center: center, radius: radius, startAngle: -(CGFloat.pi/2), endAngle: finalDegree, clockwise: false)
        contextRef.setStrokeColor(progressColor.cgColor)
        contextRef.strokePath()
    }
}
