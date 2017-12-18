//
//  LifecycleVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 10/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

//*****************************************************//
// This view demonstrates how the View Lifecycle works //

// 1. viewDidLoad() and viewWillAppear() gets called together when the view first loads
// 2. difference between the two: viewDidLoad() gets called only once while viewWillAppear gets called every time the view will appear
// 3. viewDidAppear also gets called every time view appears but viewWillAppear gets called before viewDidAppear() as the name suggests
//*****************************************************//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var didLoad: BaseLabel!
    @IBOutlet weak var didAppear: BaseLabel!
    @IBOutlet weak var willAppear: BaseLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.tintColor = UIColor.red
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.red.cgColor
        nextButton.layer.cornerRadius = 10
        
        print("\n")
        print("FirstViewDidLoad")
        
        self.didLoad.alpha = 0
        UIView.animate(withDuration: 1) {
            self.didLoad.alpha = 1
            self.didLoad.textColor = .red
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\n")
        print("FirstViewDidAppear")
        self.didAppear.alpha = 0
        UIView.animate(withDuration: 1) {
            self.didAppear.alpha = 1
            self.didAppear.textColor = .red
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\n")
        print("FirstviewWillAppear")
        self.willAppear.alpha = 0
        UIView.animate(withDuration: 1) {
            self.willAppear.alpha = 1
            self.willAppear.textColor = .red
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\n")
        print("FirstviewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\n")
        print("FirstviewWillDisappear")
    }
    
}
