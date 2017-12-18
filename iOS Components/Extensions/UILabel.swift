//
//  UILabel.swift
//  Bhagavad Gita
//
//  Created by Deepak Dewani on 14/10/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit
import  Device

extension UILabel {
    // method to set font for the given label
    func font(size: CGFloat, type: FontType, family: FontFamily) {
        if type.rawValue == "" {
            switch Device.size() {
                
            case .screen4Inch:
                self.font = UIFont(name: "\(family.rawValue)", size: CGFloat(size - 4))
                
            case .screen4_7Inch:
                self.font = UIFont(name: "\(family.rawValue)", size: CGFloat(size - 2))
                
            case .screen5_5Inch:
                self.font = UIFont(name: "\(family.rawValue)", size: CGFloat(size))
                
            default:
                print("Unknown size")
            }
        }
        else {
            switch Device.size() {
                
            case .screen4Inch:
                self.font = UIFont(name: "\(family.rawValue)-\(type.rawValue)", size: CGFloat(size - 4))
                
            case .screen4_7Inch:
                self.font = UIFont(name: "\(family.rawValue)-\(type.rawValue)", size: CGFloat(size - 2))
                
            case .screen5_5Inch:
                self.font = UIFont(name: "\(family.rawValue)-\(type.rawValue)", size: CGFloat(size))
                
            default:
                print("Unknown size")
            }
        }
    }
}
