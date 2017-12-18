//
//  SecondViewController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 10/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var didLoad: BaseLabel!
    @IBOutlet weak var didAppear: BaseLabel!
    @IBOutlet weak var willAppear: BaseLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n")
        print("SecondViewDidLoad")
        
        self.didLoad.alpha = 0
        UIView.animate(withDuration: 1) {
            self.didLoad.alpha = 1
            self.didLoad.textColor = .red
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\n")
        print("SecondViewDidAppear")
        self.didAppear.alpha = 0
        UIView.animate(withDuration: 1) {
            self.didAppear.alpha = 1
            self.didAppear.textColor = .red
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\n")
        print("SecondviewWillAppear")
        self.willAppear.alpha = 0
        UIView.animate(withDuration: 1) {
            self.willAppear.alpha = 1
            self.willAppear.textColor = .red
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\n")
        print("SecondviewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\n")
        print("SecondviewWillDisappear")
    }

}
