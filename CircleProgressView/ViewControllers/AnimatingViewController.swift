//
//  AnimatingViewController.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class AnimatingViewController: UIViewController {

    @IBOutlet weak var animatedProgressCircleView: AnimatedProgressCircleView!
    
    // MARK: - Viewlifecycle
    
    @IBAction func animateButtonPressed(_ sender: Any) {
        animatedProgressCircleView.setProgress(0.75, animate: true)
    }
}
