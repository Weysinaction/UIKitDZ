//
//  RootController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 23.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

//1 Создать экран регистрации где нужно ввести логин и
//пароль 2 поля и кнопка вход которая ведёт на второй
//экран
//2.Создать второй экран Cafe где нужно регистрировать
//гостя поля для ввода фио и через свитчи была ли
//предоплата , заказывали ли стол (да или нет )
//3 Поля для ввода номера стола
//4.Добавить третий экран счёт где выводим фио , номер
//стола и сумма
//5 Добавить кнопку «выставить счёт» расположить на
//втором экране и по нажатию выкидывать Алерт
//продолжить да или нет, если нет то убираем Алерт если
//да то переходим на третий экран
//6.На свое усмотрение добавить свою фичу в
//приложение которое его улучшит (Реализовал проверку на существование пользователя)
import UIKit

class RootController: UIViewController {

    var users: [(String?, String?)] = [("Weys", "12345")]
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    //Переход на следующий экран по нажатию кнопки
    @IBAction func buttonEntryAction(_ sender: Any) {
        let login = loginTextField.text
        let password = passwordTextField.text
        var isUserExist = false
        
        if login != nil && password != nil {
            for user in users {
                if user.0 == login && user.1 == password {
                    isUserExist = true
                } else {
                    isUserExist = false
                }
            }
        }
        if isUserExist {
            performSegue(withIdentifier: "SegueFromRootToFirst", sender: self)
        } else {
            let alertController = UIAlertController(title: "Внимание!", message: "Неверные логин/пароль", preferredStyle: .alert)
            let actionYes = UIAlertAction(title: "Ok", style: .default) { [weak self](actionYes) in
                self?.performSegue(withIdentifier: "SegueFromFirstToCheck", sender: self)
            }
            
            alertController.addAction(actionYes)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}
