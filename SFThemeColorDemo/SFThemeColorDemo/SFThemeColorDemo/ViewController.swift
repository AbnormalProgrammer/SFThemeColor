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
        self.testLabel.tc.color0.makeColor { hex in
            print(#function,"testLabel",hex)
            self.testLabel.textColor = self.colorFromHex(hex)
        }
        self.testView.tc.color1.makeColor { hex in
            print(#function,"testView",hex)
            self.testView.backgroundColor = self.colorFromHex(hex)
        }
        self.testButton.tc.color2.makeColor { hex in
            print(#function,"testButton",hex)
            self.testButton.backgroundColor = self.colorFromHex(hex)
        }
        self.testTempView = UIView.init()
        self.view.addSubview(self.testTempView!)
        self.testTempView?.frame = CGRect.init(x: 100, y: 300, width: 200, height: 200)
        self.testTempView!.tc.color2.makeColor { hex in
            self.testTempView!.backgroundColor = self.colorFromHex(hex)
        }
        // Do any additional setup after loading the view.
    }
    
    func colorFromHex(_ hex:Int) -> UIColor {
        let redInt:Int = (hex & 0xff0000) >> 16
        let greenInt:Int = (hex & 0xff00) >> 8
        let blueInt:Int = hex & 0xff
        let redFloat:CGFloat = CGFloat.init(redInt) / 255
        let greenFloat:CGFloat = CGFloat.init(greenInt) / 255
        let blueFloat:CGFloat = CGFloat.init(blueInt) / 255
        return UIColor.init(red: redFloat, green: greenFloat, blue: blueFloat, alpha: 1)
    }
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testButton: UIButton!
    @IBAction func testButtonAction(_ sender: Any) {
        if SFThemeColor.globalThemeType == .Black {
            SFThemeColor.changeGlobalTheme(.White)
            SFThemeColor.globalThemeType = .White
        } else {
            SFThemeColor.changeGlobalTheme(.Black)
            SFThemeColor.globalThemeType = .Black
        }
        self.testTempView?.removeFromSuperview()
        self.testTempView = nil
    }
    private var testTempView:UIView?
}

