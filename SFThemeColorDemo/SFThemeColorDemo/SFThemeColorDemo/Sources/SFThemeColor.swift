//
//  SFThemeColor.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/24.
//

import UIKit

enum ThemeType {
    case White
    case Black
}

class SFThemeColor: NSObject {
    // MARK: - lifecycle
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("\(type(of: self))释放了")
    }
    
    override init() {
        super.init()
    }
    
    convenience init(_ ownerView:UIView) {
        self.init()
        objc_setAssociatedObject(self, String.init(self.hashValue), self, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        NotificationCenter.default.addObserver(self, selector: #selector(themeChangedAction(_:)), name: SFThemeColor.themeChangedNotificationOfSFThemeColor, object: nil)
        self.currentThemeType = SFThemeColor.globalThemeType
    }
    // MARK: - custom methods
    // MARK: - public interfaces
    /// 回调一个16进制整数
    /// - Parameter hex: 闭包
    internal func makeColor(_ hexClosure:@escaping((Int) -> Void)) {
        self.hexClosure = hexClosure
        if self.currentThemeType == .Black {
            self.hexClosure?(self.blackThemeColor)
        } else {
            self.hexClosure?(self.whiteThemeColor)
        }
    }
    
    static internal func changeGlobalTheme(_ inputThemeType:ThemeType) -> Void {
        NotificationCenter.default.post(name: SFThemeColor.themeChangedNotificationOfSFThemeColor, object: inputThemeType)
    }
    // MARK: - actions
    @objc private func themeChangedAction(_ notification:Notification) -> Void {
        let inputThemeType:ThemeType = notification.object as! ThemeType
        if self.currentThemeType != inputThemeType  {
            self.currentThemeType = inputThemeType
            if self.currentThemeType == .Black {
                self.hexClosure?(self.blackThemeColor)
            } else {
                self.hexClosure?(self.whiteThemeColor)
            }
        }
    }
    // MARK: - accessors
    static internal let themeChangedNotificationOfSFThemeColor:Notification.Name = Notification.Name.init("themeChangedNotificationOfSFThemeColor")
    static internal var globalThemeType:ThemeType = .White
    
    private var currentThemeType:ThemeType = .White
    private var hexClosure:((Int) -> Void)?
    internal var whiteThemeColor:Int = 0xFFFFFF
    internal var blackThemeColor:Int = 0x000000
    // MARK: - delegates
}
