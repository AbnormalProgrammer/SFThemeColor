//
//  SecondViewController.swift
//  SFThemeColorDemo
//
//  Created by Stroman on 2021/8/24.
//

import UIKit

class SecondViewController: UIViewController {
    deinit {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tc.color1.makeColor { [weak self]hex in
            self?.view.backgroundColor = self?.colorFromHex(hex)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
