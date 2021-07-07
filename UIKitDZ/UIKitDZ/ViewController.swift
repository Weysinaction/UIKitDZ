//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        myTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name., object: <#T##Any?#>, queue: <#T##OperationQueue?#>, using: <#T##(Notification) -> Void#>)
    }

    //MARK: CreateUI
    
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        myTextField.placeholder = "I swift developer"
        myTextField.center = self.view.center
        self.view.addSubview(self.myTextField)
    }
    
    //Mark: -UITextFieldDelegate
    
    
    //MARK: Notification
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("UITextFieldTextDidChange = \(ncParam)")
    }
}

