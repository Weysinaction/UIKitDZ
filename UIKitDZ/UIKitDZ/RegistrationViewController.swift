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
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var famTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var numberTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var manSwitch: UISwitch!
    @IBOutlet private var femaleSwitch: UISwitch!
    
    //MARK: private properties
    private let defaults = UserDefaults.standard
    private var arrayOfUsers: [(login: String, password: String)] = []
    
    //MARK: ViewControllers methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupNotifications()
    }
    
    //MARK: private methods
    
    private func setupTextFields() {
        nameTextField.delegate = self
        nameTextField.becomeFirstResponder()
        famTextField.delegate = self
        emailTextField.delegate = self
        numberTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
    
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: IBAction
    @IBAction private func registrationButtonTapped(_ sender: Any) {
        //Проверяем все ли поля заполненны
        if ((nameTextField.text?.isEmpty) != nil),
           ((famTextField.text?.isEmpty) != nil),
           ((emailTextField.text?.isEmpty) != nil),
           ((numberTextField.text?.isEmpty) != nil),
           ((passwordTextField.text?.isEmpty) != nil),
           ((repeatPasswordTextField.text?.isEmpty) != nil) {
            presentAlert(title: "Ошибка!", message: "Необходимо заполнить все поля")
        } else {
            //Проверяем совпадают ли пароли
            if passwordTextField.text == repeatPasswordTextField.text {
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
    }
    
    @IBAction private func switchMale(_ sender: UISwitch) {
        
        femaleSwitch.isOn = manSwitch.isOn ? false : true
    }
    
    @IBAction private func switchFemale(_ sender: UISwitch) {
        manSwitch.isOn = femaleSwitch.isOn ? false : true
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
