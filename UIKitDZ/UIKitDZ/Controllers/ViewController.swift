//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

/*
5 Создать второе приложение MVC у которого на
экране будет кнопка "начать" которая вызывает Алерт
с сообщением "введите слово"
6 Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете
контролеру а контролер отдаст это в модель которая
из буквосочетания "leohl" вернет слово "hello"
контролеру а контролер отдаст это лейблу и отобразит
это на экране
7 Все кодом пишем!
*/

class ViewController: UIViewController {

    var inputMessage = Message(message: "")
    
    var mainViews = MainViews()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mainViews.configure()
        self.view.addSubview(mainViews.buttonStart)
        self.view.addSubview(mainViews.label)
        mainViews.didTap = {
            let alertController = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel) { (alertAction) in
                if let str = alertController.textFields?.first?.text {
                    self.inputMessage.message = str
                    self.mainViews.label.text = self.inputMessage.returnNewValue()
                }
            }
            alertController.addAction(alertAction)
            alertController.addTextField(configurationHandler: nil)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

