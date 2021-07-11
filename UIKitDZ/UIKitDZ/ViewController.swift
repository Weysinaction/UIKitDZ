//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton = UIButton()
    let normalImage = UIImage(systemName: "person.fill")
    let pressedImage = UIImage(systemName: "alarm")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myButton.setTitle("1", for: .normal)
        myButton.setTitle("2", for: .highlighted)
        myButton.center = self.view.center
        myButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        myButton.setBackgroundImage(normalImage, for: .normal)
        myButton.setBackgroundImage(pressedImage, for: .highlighted)
        self.view.addSubview(myButton)
    }

    
    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button is tapped")
    }
}

