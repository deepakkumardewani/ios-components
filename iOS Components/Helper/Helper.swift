//
//  Helper.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import Device


enum FontType: String {
    case Bold = "Bold"
    case Italic = "Italic"
    case Medium = "Medium"
    case Default = ""
}

enum FontFamily: String {
    case Helvetica = "Helvetica"
    case Georgia = "Georgia"
    case Verdana = "Verdana"
    case Futura = "Futura"
    case Default = "HelveticaNeue"
}

public func delay(for delay: TimeInterval, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)
}



