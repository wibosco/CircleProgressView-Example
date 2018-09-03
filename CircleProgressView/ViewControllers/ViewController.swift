//
//  ViewController.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let length = CGFloat(200)
//        let progressCircleView = ProgressCircleView(frame: CGRect(x: view.center.x - length/2, y: 60, width: length, height: length), progress: 0.7, lineWidth: 18, trackColor: UIColor.beige, progressColor: UIColor.pastelBlue)
//        
//        view.addSubview(progressCircleView)
    }
}

extension UIColor {
    
    class var beige: UIColor {
        return UIColor(red: CGFloat(242.0/255.0), green: CGFloat(238.0/255.0), blue: CGFloat(233.0/255.0), alpha: 1)
    }
    
    class var pastelBlue: UIColor {
        return UIColor(red: CGFloat(24.0/255.0), green: CGFloat(189.0/255.0), blue: CGFloat(230.0/255.0), alpha: 1)
    }
}

