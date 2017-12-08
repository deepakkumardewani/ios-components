//
//  UIViewController.swift
//  Bhagavad Gita
//
//  Created by Deepak Dewani on 03/09/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import Foundation
import UIKit

var backgroundView : UIView!

extension UIViewController {
    
    func addBackgroundView() {
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        backgroundView.alpha = 0
        backgroundView.backgroundColor = UIColor.black
        
        self.view.addSubview(backgroundView)
    }
    
    func backgroundBlur() {
        backgroundView.alpha = 0
    }
    
    func backgroundClear() {
        backgroundView.alpha = 0.5
    }
}
