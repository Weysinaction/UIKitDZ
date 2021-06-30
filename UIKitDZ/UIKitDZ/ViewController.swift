//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: Public properties
    static var userArray: [(login: String, password: String)] = []
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    }
    //MARK: Public methods
    func checkUser(login: String, password: String) -> Bool {
        var isUser = false
        for user in ViewController.userArray {
            if login == user.login && password == user.password {
                isUser = true
            } else {
                isUser = false
            }
        }
        return isUser
    }
    
    //MARK: IBAction
    @IBAction func logInTapped(_ sender: Any) {
        if checkUser(login: loginTextField.text ?? "", password: passwordTextField.text ?? "") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

//extension ViewController: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 5
//    }
//
//
//}
//
//extension ViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch row {
//        case 0:
//            return "First"
//        case 1:
//            return "Second"
//        case 2:
//            return "Third"
//        case 3:
//            return "Fourth"
//        case 4:
//            return "Fifth"
//        default:
//            return ""
//        }
//    }
//}
