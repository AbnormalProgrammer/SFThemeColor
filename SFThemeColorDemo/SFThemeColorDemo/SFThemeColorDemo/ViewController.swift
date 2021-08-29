//
//  ViewController.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testView:TestView = TestView.init()
        testView.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(testView)
        weak var weakTestView = testView
        testView.tc.color1.makeColor {weakTestView?.backgroundColor = UIColor.colorFromHex($0)}
        // Do any additional setup after loading the view.
    }

    @IBAction func testButtonAction(_ sender: Any) {
        if SFThemeColor.globalThemeType == .Black {
            SFThemeColor.changeGlobalTheme(.White)
            SFThemeColor.globalThemeType = .White
        } else {
            SFThemeColor.changeGlobalTheme(.Black)
            SFThemeColor.globalThemeType = .Black
        }
    }
}

