//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

/*
 1 Создать экран регистрации где нужно ввести логин и
 пароль 2 поля и кнопка вход которая ведёт на второй
 экран.
 2 По нажатию на “Войти” переходим на второй экран
 Birthday (Это не таблица) куда будут добавляться дни
 рождения с третьего экрана. Лэйблы “18 дней” и ”10
 марта, в среду…” захардкожены.
 3 По нажатию на кнопку + попадаем на третий экран.
 Дата, возраст, пол - пикеры. Instagram -
 алертКонтроллер.
 */

class ViewController: UIViewController {

    let button = UIButton()
    let labelSignIn = UILabel()
    let labelEmail = UILabel()
    let labelPassword = UILabel()
    let labelEntryWithFaceId = UILabel()
    let textFieldLogin = UITextField()
    let textFieldPassword = UITextField()
    let dividerOne = UIView()
    let dividerTwo = UIView()
    let faceIdSwitch = UISwitch()
    let labelHeader = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureView()
        
        self.view.addSubview(button)
        self.view.addSubview(textFieldLogin)
        self.view.addSubview(textFieldPassword)
        self.view.addSubview(dividerOne)
        self.view.addSubview(dividerTwo)
        self.view.addSubview(labelSignIn)
        self.view.addSubview(labelEmail)
        self.view.addSubview(labelPassword)
        self.view.addSubview(labelHeader)
        self.view.addSubview(labelEntryWithFaceId)
        self.view.addSubview(faceIdSwitch)
    }

    func configureView() {
        //Создаем вью и прописываем им проперти
        
        //Создаем image view
        labelHeader.frame = CGRect(x: 130, y: 100, width: 150, height: 80)
        labelHeader.text = "Birthday Reminder"
        labelHeader.textAlignment = .center
        labelHeader.layer.masksToBounds = true
        labelHeader.layer.cornerRadius = 5
        //labelHeader.borders
        
        //Создаем лейблы
        labelSignIn.frame = CGRect(x: 53, y: 190, width: 150, height: 50)
        labelSignIn.text = "Sign In"
        labelSignIn.font = UIFont.boldSystemFont(ofSize: 28)
        
        labelEmail.frame = CGRect(x: 53, y: 250, width: 150, height: 50)
        labelEmail.text = "Email"
        labelEmail.textColor = .systemIndigo
        labelEmail.font = UIFont.boldSystemFont(ofSize: 16)
        
        labelPassword.frame = CGRect(x: 53, y: 350, width: 150, height: 50)
        labelPassword.text = "Password"
        labelPassword.textColor = .systemIndigo
        labelPassword.font = UIFont.boldSystemFont(ofSize: 16)
        
        //Создаем поля логина и пароля
        textFieldLogin.frame = CGRect(x: 50, y: 280, width: 300, height: 50)
        textFieldLogin.placeholder = "Email"
        
    
        textFieldPassword.placeholder = "Password"
        textFieldPassword.frame = CGRect(x: 50, y: 380, width: 300, height: 50)
        textFieldPassword.isSecureTextEntry = true
        
        //Создаем разделители
        dividerOne.frame = CGRect(x: 50, y: 331, width: 300, height: 1)
        dividerOne.backgroundColor = .systemGray2
        
        dividerTwo.frame = CGRect(x: 50, y: 431, width: 300, height: 1)
        dividerTwo.backgroundColor = .systemGray2
        
        //label
        labelEntryWithFaceId.frame = CGRect(x: 165, y: 471, width: 150, height: 50)
        labelEntryWithFaceId.text = "Вход по Face ID"
        labelEntryWithFaceId.font = UIFont.boldSystemFont(ofSize: 18)
        
        //uiSwitch
        faceIdSwitch.frame = CGRect(x: 310, y: 480, width: 0, height: 0)
        
        //Создаем кнопку
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemIndigo
        button.tintColor = .white
        button.frame = CGRect(x: 60, y: 580, width: 300, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        

    }
    @objc private func buttonTapped() {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

