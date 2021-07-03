//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: public properties
    let button = UIButton()
    let labelLogin = UILabel()
    let labelPassword = UILabel()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let imageView = UIImageView()
    let dividerOne = UIView()
    let dividerTwo = UIView()
    
    
    var navController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "1st screen"

        initImageView()
        initLabels()
        initTextFields()
        initButton()
        initDividers()
    }
    
    //MARK: methods
    func initImageView() {
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .gray
        self.view.addSubview(imageView)
    }
    
    func initLabels() {
        labelLogin.frame = CGRect(x: 80, y: 350, width: 260, height: 50)
        labelLogin.text = "Логин"
        labelLogin.textColor = .systemBlue
        self.view.addSubview(labelLogin)
        
        labelPassword.frame = CGRect(x: 80, y: 450, width: 260, height: 50)
        labelPassword.text = "Пароль"
        labelPassword.textColor = .systemBlue
        self.view.addSubview(labelPassword)
    }
    
    func initTextFields() {
        loginTextField.frame = CGRect(x: 80, y: 380, width: 260, height: 50)
        loginTextField.placeholder = "Введите логин"
        loginTextField.delegate = self
        loginTextField.keyboardType = .asciiCapableNumberPad
        self.view.addSubview(loginTextField)
        
        passwordTextField.frame = CGRect(x: 80, y: 480, width: 260, height: 50)
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
    }
    
    func initButton() {
        button.frame = CGRect(x: 80, y: 650, width: 260, height: 50)
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        self.view.addSubview(button)
    }
    
    func initDividers() {
        dividerOne.frame = CGRect(x: 80, y: 420, width: 260, height: 1)
        dividerOne.backgroundColor = .opaqueSeparator
        self.view.addSubview(dividerOne)
        
        dividerTwo.frame = CGRect(x: 80, y: 520, width: 260, height: 1)
        dividerTwo.backgroundColor = .opaqueSeparator
        self.view.addSubview(dividerTwo)
    }

    //MARK: Selectors
    @objc func buttonTapped(sender: UIButton) {
        let viewController = FoodViewController()
        self.navController = UINavigationController.init(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }

    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        
        return true
    }
}

