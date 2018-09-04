//
//  HorseshoeView.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

@IBDesignable
class HorseshoeView: UIView {

    private let trackLayer: CAShapeLayer = {
        let trackLayer = CAShapeLayer()
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.strokeStart = 0.0
        
        return trackLayer
    }()
    
    private let progressLayer: CAShapeLayer = {
        let progressLayer = CAShapeLayer()
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.lineCap = kCALineCapRound
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        
        return progressLayer
    }()
    
    @IBInspectable var progress: CGFloat = 0 {
        didSet {
            progressLayer.strokeEnd = progress
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 0 {
        didSet {
            progressLayer.lineWidth = lineWidth
            trackLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable var trackColor: UIColor = UIColor.lightGray {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    @IBInspectable var progressColor: UIColor = UIColor.darkGray {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }
    
    // MARK: - InterfaceBuilder
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        commonInit()
    }
    
    // MARK: - Viewlifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = (min(frame.size.width, frame.size.height) - lineWidth)/2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let startAngle = -1.25 * CGFloat.pi
        let endAngle = startAngle + 1.5 * CGFloat.pi
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        trackLayer.path = circlePath.cgPath
        progressLayer.path = circlePath.cgPath
    }
    
    // MARK: - Animate
    
    func setProgress(_ progress: CGFloat, fromProgress: CGFloat = 0,  animate: Bool) {
        guard animate else {
            progressLayer.strokeEnd = progress
            return
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = CFTimeInterval(2)
        animation.fromValue = fromProgress
        animation.toValue = progress
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        progressLayer.strokeEnd = progress
        progressLayer.add(animation, forKey: "animateRing")
    }
}
