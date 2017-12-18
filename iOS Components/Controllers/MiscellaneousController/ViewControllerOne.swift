//
//  ViewControllerTwo.swift
//  iOS Components
//
//  Created by Deepak Dewani on 10/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

//*********************************************************************************//
// This view demonstrates use of UIStepper, UISlider, UIButton, UISegmentedControl //
//*********************************************************************************//

//===== 1. Configure properties =====//
//===== 2. Perform action =====//


import UIKit

class ViewControllerOne: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var cornerRadius: UISlider!
    @IBOutlet weak var numberStepper: UIStepper!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        //******************************//
        //========== UIStepper =========//
        //******************************//
        //<-- 1 -->//
        numberStepper.wraps = true
        numberStepper.autorepeat = true
        numberStepper.maximumValue = 10
        numberStepper.tintColor = UIColor.red
        //========================================//
        
        
        //******************************//
        //========== UISlider =========//
        //******************************//
        //<-- 1 -->//
        cornerRadius.value = 0
        cornerRadius.minimumValue = 0
        cornerRadius.maximumValue = 20
        cornerRadius.minimumTrackTintColor = UIColor.red
        cornerRadius.maximumTrackTintColor = UIColor.green
        cornerRadius.thumbTintColor = UIColor.orange
        //========================================//
        
        
        //******************************//
        //========== UIButton =========//
        //******************************//
        //<-- 1 -->//
        buttonOutlet.setTitle("0", for: .normal)
        buttonOutlet.font(size: 50, type: .Bold, family: .Default)
        buttonOutlet.tintColor = UIColor.gray
        buttonOutlet.layer.cornerRadius = 10
        buttonOutlet.layer.borderWidth = 1
        buttonOutlet.layer.borderColor = UIColor.gray.cgColor
        buttonOutlet.backgroundColor = UIColor.clear
        buttonOutlet.isEnabled = true
        buttonOutlet.isSelected = false
        buttonOutlet.isHighlighted = false
        //========================================//
        
        
        //******************************//
        //===== UISegmentedControl =====//
        //******************************//
        //<-- 1 -->//
        segmentedControl.tintColor = UIColor.red
        segmentedControl.selectedSegmentIndex = 1
        //========================================//
    }
    
    //******************************//
    //========== UIButton =========//
    //******************************//
    //<-- 2 -->//
    @IBAction func resetAction(_ sender: UIButton) {
        // setting title for button
        buttonOutlet.setTitle("0", for: .normal)
    }
    //========================================//
    
    
    //******************************//
    //========== UISlider =========//
    //******************************//
    //<-- 2 -->//
    @IBAction func corderRadiusAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        buttonOutlet.layer.cornerRadius = currentValue
    }
    //========================================//
    
    
    //******************************//
    //========== UIStepper =========//
    //******************************//
    //<-- 2 -->//
    @IBAction func stepperAction(_ sender: UIStepper) {
        buttonOutlet.setTitle(Int(sender.value).description, for: .normal)
        buttonOutlet.isHighlighted = false
    }
    //========================================//
    
    
    //******************************//
    //====== UISegmentedControl ====//
    //******************************//
    //<-- 2 -->//
    @IBAction func buttonStateChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            buttonOutlet.isSelected = true
            buttonOutlet.isEnabled = false
            buttonOutlet.isHighlighted = false
        case 1:
            buttonOutlet.isEnabled = true
            buttonOutlet.isSelected = false
            buttonOutlet.isHighlighted = false
        case 2:
            buttonOutlet.isHighlighted = true
            buttonOutlet.isSelected = false
            buttonOutlet.isEnabled = false
        default:
            break
        }
    }
    //========================================//
}
