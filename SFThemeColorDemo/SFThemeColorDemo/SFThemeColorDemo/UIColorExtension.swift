//
//  UIColorExtension.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/29.
//

import Foundation
import UIKit

extension UIColor {
    static func colorFromHex(_ hex:Int) -> UIColor {
        let redInt:Int = (hex & 0xff0000) >> 16
        let greenInt:Int = (hex & 0xff00) >> 8
        let blueInt:Int = hex & 0xff
        let redFloat:CGFloat = CGFloat.init(redInt) / 255
        let greenFloat:CGFloat = CGFloat.init(greenInt) / 255
        let blueFloat:CGFloat = CGFloat.init(blueInt) / 255
        return UIColor.init(red: redFloat, green: greenFloat, blue: blueFloat, alpha: 1)
    }
}
