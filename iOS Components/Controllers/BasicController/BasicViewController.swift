//
//  BasicViewController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {

    @IBOutlet weak var nightSwitch: UISwitch!
    @IBOutlet weak var basicButton: UIButton!
    @IBOutlet weak var basicLabel: UILabel!
    var counter: Int!
    
    let basicArray = ["this is a basic view controller", "you can click the button to change the text", "you can toggle the switch to change the theme"]
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.title = "Basic View"
        basicLabel.text = "Click to button to know more!"
        basicButton.font(size: 20, type: .Default, family: .Default)
        basicButton.titleLabel?.text = "Button"
        basicButton.layer.cornerRadius = 10
        basicButton.tintColor = .red
        basicButton.layer.borderColor = UIColor.red.cgColor
        basicButton.layer.borderWidth = 1
    }
    
    @IBAction func toggleSwitch(_ sender: Any) {
        if nightSwitch.isOn {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor.white
                self.basicLabel.textColor = UIColor.black
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor.hexStringToUIColor(hex: "#181818")
                self.basicLabel.textColor = UIColor.white
            })
        }
    }
    
    @IBAction func changeTextButton(_ sender: Any) {
        if counter == 2 {
            counter = 0
        }
        else {
            counter = counter + 1
        }
        basicLabel.text = basicArray[counter]
    }
}
