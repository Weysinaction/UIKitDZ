//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mySwitchTwo = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = .orange
        self.button.setTitle("Ok", for: .normal)
        self.button.setTitle("Кнопка нажата", for: .highlighted)
        
        self.view.addSubview(button)
        
        self.mySwitchTwo.frame = CGRect.zero
        
        self.mySwitchTwo.center = self.view.center
        self.view.addSubview(self.mySwitchTwo)
        
        //off
        self.mySwitchTwo.tintColor = .green
        
        //thumbler
        self.mySwitchTwo.thumbTintColor = .red
        
        //on
        self.mySwitchTwo.onTintColor = .blue
        
        self.mySwitchTwo.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }

    @objc func isOn(target: UISwitch) {
        if target.isOn {
            button.isUserInteractionEnabled = false
        } else {
            button.isUserInteractionEnabled = true
        }
    }

}

