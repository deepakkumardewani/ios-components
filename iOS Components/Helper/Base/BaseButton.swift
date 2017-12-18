//
//  BaseButton.swift
//  Bhagavad Gita
//
//  Created by Deepak Dewani on 21/10/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.font(size: 20, type: .Default, family: .Default)
    }
}
