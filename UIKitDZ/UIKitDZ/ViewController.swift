//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: private properties
    let defaults = UserDefaults.standard
    
    //MARK: ViewCOntroller's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEditText()
    }


    //MARK: private methods
    private func setupEditText() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func checkUser() -> Bool {
        if let login = loginTextField.text {
            let userInfo = defaults.array(forKey: login) as? [String] ?? [String]()
            if  userInfo.count > 0 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    //MARK: IBAction
    @IBAction func entryTapped(_ sender: Any) {
        if checkUser() {
            if let marksViewController = self.storyboard?.instantiateViewController(identifier: "MarksViewController") {
                self.navigationController?.pushViewController(marksViewController, animated: true)
            }
        } else {
            presentAlert(title: "Ошибка!", message: "Неверные логин или пароль")
        }
    }
    
    @IBAction func registrationTapped(_ sender: Any) {
        if let registrationViewController = self.storyboard?.instantiateViewController(identifier: "RegistrationViewController") {
            self.navigationController?.pushViewController(registrationViewController, animated: true)
        }
    }
    
}

//MARK: Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            self.passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            self.passwordTextField.resignFirstResponder()
        }
        
        return true
    }
}
