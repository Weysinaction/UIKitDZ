//
//  SignInViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 30.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var sigInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    //MARK: IBAction
    //Создаем кнопку подтверждения регистрации
    @IBAction func sigInButtonTapped(_ sender: Any) {
        if passwordTextField.text != "" && loginTextField.text != "" {
            if passwordTextField.text == repeatPasswordTextField.text {
                ViewController.userArray.append((login: loginTextField.text!, password: passwordTextField.text!))
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            } else {
                createAlertOk(name: "Внимание!", message: "Пароли должны совпадать.")
            }
        }
        else {
            createAlertOk(name: "Внимание!", message: "Нельзя вводить пустые значение.")
        }
    }
    
    //MARK: Public methods
    
    func createAlertOk(name: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
