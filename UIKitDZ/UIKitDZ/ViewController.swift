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
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
        
            
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

    //MARK: selectors
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    //Mark: -UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.myTextField.resignFirstResponder()
        return true
    }
}

