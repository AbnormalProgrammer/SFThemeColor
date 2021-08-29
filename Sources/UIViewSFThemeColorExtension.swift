//
//  UIViewSFThemeColorExtension.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/24.
//

import Foundation
import UIKit

extension UIView {
    var tc:SFThemeColor {
        get {
            return SFThemeColor.init(self)
        }
    }
}
