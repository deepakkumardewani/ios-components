//
//  ViewControllerFive.swift
//  iOS Components
//
//  Created by Deepak Dewani on 18/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class ViewControllerFive: UIViewController {
    @IBOutlet weak var activityOutlet: UIActivityIndicatorView!
    @IBOutlet weak var progressOutlet: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    var progressBarTimer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        progressLabel.font(size: 20, type: .Default, family: .Default)
        
        progressOutlet.progressTintColor = .red
        progressOutlet.trackTintColor = .green
        progressOutlet.progress = 0.0
        
        
        resetButtonOutlet.font(size: 20, type: .Default, family: .Default)
        resetButtonOutlet.tintColor = .red
        resetButtonOutlet.layer.cornerRadius = 10
        resetButtonOutlet.layer.borderWidth = 1
        resetButtonOutlet.layer.borderColor = UIColor.red.cgColor
        resetButtonOutlet.backgroundColor = .clear
        
        
        startTimer()
        activityOutlet.startAnimating()
    }
    func startTimer() {
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(ViewControllerFive.updateProgressBar), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressBar(){
        
        if progressOutlet.progress == 1.0 {
            activityOutlet.stopAnimating()
            progressBarTimer.invalidate()
        }
        else {
            progressOutlet.progress += 0.01
            progressLabel.text = String(format: "%02d", Int(progressOutlet.progress * 100)) + "%"
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        activityOutlet.startAnimating()
        progressLabel.text = "0%"
        progressOutlet.setProgress(0, animated: false)
        progressBarTimer.invalidate()
        if progressOutlet.progress == 0 {
            startTimer()
        }
        
    }
}
