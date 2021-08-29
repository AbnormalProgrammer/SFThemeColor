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
            self?.view.backgroundColor = UIColor.colorFromHex(hex)
        }
        // Do any additional setup after loading the view.
    }
}
