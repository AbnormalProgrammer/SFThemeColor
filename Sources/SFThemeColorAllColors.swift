//
//  SFThemeColorAllColors.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/24.
//

import Foundation

extension SFThemeColor {
    var color0:SFThemeColor {
        get {
            self.blackThemeColor = 0x8B008B
            self.whiteThemeColor = 0xAFEEEE
            return self
        }
    }
    
    var color1:SFThemeColor {
        get {
            self.blackThemeColor = 0x2F4F4F
            self.whiteThemeColor = 0x7FFFAA
            return self
        }
    }
    
    var color2:SFThemeColor {
        get {
            self.blackThemeColor = 0x00FF00
            self.whiteThemeColor = 0xFAFAD2
            return self
        }
    }
}
