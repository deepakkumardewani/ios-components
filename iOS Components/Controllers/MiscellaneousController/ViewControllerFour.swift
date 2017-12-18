//
//  ViewControllerFour.swift
//  iOS Components
//
//  Created by Deepak Dewani on 18/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var vibrancySwitch: UISwitch!
    @IBOutlet weak var blurStyleControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        imageViewOutlet.image = UIImage(named: "city")
        
        visualEffectView.effect = UIBlurEffect(style: .light)
        
        vibrancySwitch.isOn = false
        
        blurStyleControl.selectedSegmentIndex = 1
    }
    
    @IBAction func vibranyAction(_ sender: Any) {
        if vibrancySwitch.isOn {
            let blurEffect = UIBlurEffect(style: .light)
            let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
            
        }
        else {
            
        }
    }
    
    @IBAction func blurStyleAction(_ sender: Any) {
        
    }
    
}
