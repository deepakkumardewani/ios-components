//
//  ViewController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 10/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

//************************************************//
// This view demonstrates use of UISwitch, UIView //
//************************************************//

//===== 1. Configure properties =====//
//===== 2. Perform action =====//

import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var borderWidthSlider: UISlider!
    @IBOutlet weak var viewOpacity: UISlider!
    
    @IBOutlet weak var shadowOpacity: UISlider!
    @IBOutlet weak var shadowRadius: UISlider!
    @IBOutlet weak var shadowOffsetWidth: UISlider!
    @IBOutlet weak var shadowOffsetHeight: UISlider!
    
    @IBOutlet weak var roundSwitch: UISwitch!
    @IBOutlet weak var shadowSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        //******************************//
        //========== UISwitch ==========//
        //******************************//
        //<-- 1 -->//
        // turning switch off on start
        roundSwitch.isOn = false
        shadowSwitch.isOn = false
        //================================//
        
        
        //****************************//
        //========== UIView ==========//
        //****************************//
        //<-- 1 -->//
        customView.backgroundColor = .orange
        customView.layer.cornerRadius = 10
        customView.layer.borderWidth = 1
        customView.layer.borderColor = UIColor.gray.cgColor
        customView.alpha = 1
        //============================//
        
        
        // these values can be varied as per your need
        viewOpacity.minimumValue = 0
        viewOpacity.maximumValue = 1
        viewOpacity.value = 1
        
        // these values can be varied as per your need
        cornerRadiusSlider.minimumValue = 0
        cornerRadiusSlider.maximumValue = 100
        
        // these values can be varied as per your need
        borderWidthSlider.minimumValue = 0
        borderWidthSlider.maximumValue = 10
        
        // these values can be varied as per your need
        shadowOpacity.minimumValue = 0
        shadowOpacity.maximumValue = 1
        shadowRadius.minimumValue = 0
        shadowRadius.maximumValue = 10
        shadowOffsetWidth.minimumValue = 0
        shadowOffsetWidth.maximumValue = 10
        shadowOffsetHeight.minimumValue = 0
        shadowOffsetHeight.maximumValue = 10
    }
    
    @IBAction func cornerRadiusAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        customView.layer.cornerRadius = currentValue
    }
    
    @IBAction func borderWidthAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        customView.layer.borderWidth = currentValue
    }
    
    
    @IBAction func viewOpacityAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        customView.alpha = currentValue
    }
    
    
    @IBAction func shadowOpacityAction(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        self.customView.layer.shadowOpacity = currentValue
    }
    
    @IBAction func shadowRadiusAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        self.customView.layer.shadowRadius = currentValue
    }
    
    @IBAction func shadowOffsetWidthAction(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        self.customView.layer.shadowOffset = CGSize(width: currentValue, height: 0.0)
    }
    
    @IBAction func shadowOffsetHeightAction(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        self.customView.layer.shadowOffset = CGSize(width: 0.0, height: currentValue)
    }
    
    
    //**********************************************************//
    //=================== UISwitch =============================//
    //**********************************************************//
    //<-- 2 -->//
    @IBAction func makeCircle(_ sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 0.7, animations: {
                self.customView.clipsToBounds = true
                self.customView.layer.cornerRadius = self.customView.frame.width / 2
            })
            
        }
        else {
            UIView.animate(withDuration: 1, animations: {
                self.customView.clipsToBounds = true
                self.customView.layer.cornerRadius = 0
            })
        }
    }
    
    @IBAction func giveShadow(_ sender: UISwitch) {
        if sender.isOn {
            self.shadowOpacity.value = 0.5
            self.shadowRadius.value = 4.0
            self.shadowOffsetWidth.value = 4.0
            self.shadowOffsetHeight.value = 4.0
            
            // these values can be varied as per your need
            // drop shadow
            self.customView.layer.shadowColor = UIColor.lightGray.cgColor
            self.customView.layer.shadowOpacity = 0.5
            self.customView.layer.shadowRadius = 4.0
            self.customView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        }
        else {
            self.shadowOpacity.value = 0.0
            self.shadowRadius.value = 0.0
            self.shadowOffsetWidth.value = 0.0
            self.shadowOffsetHeight.value = 0.0
            
            // these values can be varied as per your need
            // drop shadow
            self.customView.layer.shadowColor = UIColor.clear.cgColor
            self.customView.layer.shadowOpacity = 0.0
            self.customView.layer.shadowRadius = 0.0
            self.customView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        }
    }
    //==========================================================//
}
