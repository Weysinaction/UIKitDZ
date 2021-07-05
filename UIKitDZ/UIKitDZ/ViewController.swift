//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        myLabel.frame = labelFrame
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.text = "The swift developers"
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.sizeToFit()
        myLabel.textColor = .black
        myLabel.shadowColor = .lightGray
        myLabel.shadowOffset = CGSize(width: 4 , height: 4)
        myLabel.center = self.view.center
        self.view.addSubview(myLabel)
    }


}

