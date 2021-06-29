//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 29.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let imageView = UIImageView()
    let labelLogin = UILabel()
    let labelPassword = UILabel()
    let textFieldLogin = UITextField()
    let textFieldPassword = UITextField()
    let buttonLogin = UIButton()
    let dividerOne = UIView()
    let dividerTwo = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        initViews()
        
    }
    
    //Инициализиуруем вью и добавляем их на экран
    func initViews() {
        imageView.frame = CGRect(x: 130, y: 130, width: 150, height: 150)
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .darkGray
        self.view.addSubview(imageView)
        
        labelLogin.frame = CGRect(x: 110, y: 300, width: 150, height: 30)
        labelLogin.text = "Логин"
        self.view.addSubview(labelLogin)
        
        textFieldLogin.frame = CGRect(x: 110, y: 330, width: 200, height: 40)
        textFieldLogin.placeholder = "Введите логин"
        textFieldLogin.layer.cornerRadius = 7
        textFieldLogin.layer.borderWidth = 1
        textFieldLogin.layer.borderColor = UIColor.darkGray.cgColor
        self.view.addSubview(textFieldLogin)
        
//        dividerOne.frame = CGRect(x: 100, y: 360, width: 200, height: 1)
//        dividerOne.backgroundColor = .lightGray
//        self.view.addSubview(dividerOne)
        
        labelPassword.frame = CGRect(x: 110, y: 390, width: 200, height: 30)
        labelPassword.text = "Пароль"
        self.view.addSubview(labelPassword)
        
        textFieldPassword.frame = CGRect(x: 110, y: 420, width: 200, height: 40)
        textFieldPassword.placeholder = "Введите пароль"
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.layer.cornerRadius = 7
        textFieldPassword.layer.borderWidth = 1
        textFieldPassword.layer.borderColor = UIColor.darkGray.cgColor
        self.view.addSubview(textFieldPassword)
        
//        dividerTwo.frame = CGRect(x: 100, y: 440, width: 200, height: 1)
//        dividerTwo.backgroundColor = .lightGray
//        self.view.addSubview(dividerTwo)
        
        buttonLogin.frame = CGRect(x: 110, y: 510, width: 200, height: 50)
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.layer.cornerRadius = 7
        //buttonLogin.layer.borderWidth = 1
        buttonLogin.backgroundColor = .darkGray
        buttonLogin.tintColor = .systemBackground
        buttonLogin.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(buttonLogin)
        buttonLogin.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonLoginTapped (sender: UIButton) {
        if sender == buttonLogin {
            let viewController = ViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
