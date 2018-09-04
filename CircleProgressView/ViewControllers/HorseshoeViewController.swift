//
//  HorseshoeViewController.swift
//  CircleProgressView
//
//  Created by William Boles on 03/09/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class HorseshoeViewController: UIViewController {

    @IBOutlet weak var horseshoeView: HorseshoeView!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horseshoeView.progress = 0.75
    }
    
    // MARK: - Viewlifecycle
    
    @IBAction func animateButtonPressed(_ sender: Any) {
        horseshoeView.setProgress(0.75, animate: true)
    }
}
