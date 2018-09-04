//
//  ViewController.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UIViewController {

    @IBOutlet weak var drawingProgressCircleView: DrawingProgressCircleView!
    @IBOutlet weak var progressCircleView: ProgressCircleView!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawingProgressCircleView.progress = 0.75
        progressCircleView.progress = 0.75
    }
}
