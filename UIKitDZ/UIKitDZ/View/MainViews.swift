//
//  MainViews.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class MainViews: UIView {

    let buttonStart = UIButton(type: .system)
    let label = UILabel()
    var didTap: (() -> Void)?
    func configure() {
        let buttonX = 150
        let buttonY = 350
        let buttonWidth = 150
        let buttonHeight = 50
        
        let labelX = 150
        let labelY = 150
        let labelWidth = 150
        let labelHeight = 50
        
        buttonStart.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        buttonStart.backgroundColor = .black
        buttonStart.setTitle("Начать", for: .normal)
        buttonStart.tintColor = .white
        
        label.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        label.textAlignment = .center
        label.text = "default text"
        
        buttonStart.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if let closure = didTap {
            closure()
        }
    }

}
