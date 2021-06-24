//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.center = view.center
        
        picker.datePickerMode = .countDownTimer
        
        self.view.addSubview(picker)
        
        picker.countDownDuration = 2 * 60
        
        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker: )), for: .valueChanged)
        
    }

    @objc func datePickerChange(paramDatePicker: UIDatePicker) {
        if paramDatePicker.isEqual(self.picker) {
            print("dateChange : = ", paramDatePicker.date)
            
        }
    }
}

