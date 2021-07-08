//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 08.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class RegistrationViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var famTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var manSwitch: UISwitch!
    @IBOutlet var femaleSwitch: UISwitch!
    
    //MARK: private properties
    let defaults = UserDefaults.standard
    var arrayOfUsers: [(login: String, password: String)] = []
    
    //MARK: ViewControllers methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupNotifications()
    }
    
    //MARK: private methods
    
    //Функция для настройки textFields
    private func setupTextFields() {
        nameTextField.delegate = self
        nameTextField.becomeFirstResponder()
        famTextField.delegate = self
        emailTextField.delegate = self
        numberTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    //функция для настройки notifications
    private func setupNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
    
    //Функция для вывода алерта
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: IBAction
    @IBAction func registrationButtonTapped(_ sender: Any) {
        //Проверяем все ли поля заполненны
        guard (nameTextField.text != "" && famTextField.text != "" && emailTextField.text != "" && numberTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != "")  else {
            presentAlert(title: "Ошибка!", message: "Необходимо заполнить все поля")
            return
        }
        
        //Проверяем совпадают ли пароли
        if (passwordTextField.text == repeatPasswordTextField.text) {
            //Проверяем зарегистрирован ли пользователь
            //Берем запись из юзер дефолтс, если массив по введённому Логину пустой, значит пользователь не зарегистрирован
            let userInfo = defaults.array(forKey: nameTextField.text!) as? [String] ?? [String]()
            if userInfo.count == 0 {
                let userArray = [nameTextField.text!, passwordTextField.text!]
                defaults.set(userArray, forKey: nameTextField.text!)
                self.navigationController?.popViewController(animated: true)
            } else {
                presentAlert(title: "Ошибка!", message: "Пользователь с таким именем уже зарегистрирован")
            }
            
        } else {
            presentAlert(title: "Ошибка!", message: "Пароли не совпадают")
            
        }
    }
    
    @IBAction func switchMale(_ sender: UISwitch) {
        if manSwitch.isOn {
            femaleSwitch.isOn = false
        } else {
            femaleSwitch.isOn = true
        }
    }
    
    @IBAction func switchFemale(_ sender: UISwitch) {
        if femaleSwitch.isOn {
            manSwitch.isOn = false
        } else {
            manSwitch.isOn = true
        }
    }
}


//MARK: Extensions
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            famTextField.becomeFirstResponder()
        case famTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            numberTextField.becomeFirstResponder()
        case numberTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            repeatPasswordTextField.becomeFirstResponder()
        case repeatPasswordTextField:
            repeatPasswordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
}
