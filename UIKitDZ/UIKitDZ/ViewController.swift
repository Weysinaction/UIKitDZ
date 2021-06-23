//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonSum = UIButton(type: .system)
    let buttonChoose = UIButton(type: .system)
    var labelName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonSumX = 65
        let buttonSumY = 350
        let buttonWidth = 100
        let buttonHeight = 50
        
        let buttonChooseX = 215
        let buttonChooseY = 350
        
        let labelNameX = 15
        let labelNameY = 150
        let labelNameWidth = 350
        let labelNameHeight = 50
        
        labelName = UILabel(frame: CGRect(x: labelNameX, y: labelNameY, width: labelNameWidth, height: labelNameHeight))
        
        buttonSum.setTitle("Сложение", for: .normal)
        buttonSum.tintColor = .white
        buttonSum.backgroundColor = .red
        buttonSum.addTarget(self, action: #selector(buttonSumClicked), for: .touchUpInside)
        
        buttonChoose.setTitle("Угадай число", for: .normal)
        buttonChoose.tintColor = .white
        buttonChoose.backgroundColor = .green
        buttonChoose.addTarget(self, action: #selector(buttonChooseClicked), for: .touchUpInside)
        
        labelName.textAlignment = .center
        labelName.text = "Введите ФИО"
        
        buttonSum.frame = CGRect(x: buttonSumX, y: buttonSumY, width: buttonWidth, height: buttonHeight)
        buttonChoose.frame = CGRect(x: buttonChooseX, y: buttonChooseY, width: buttonWidth, height: buttonHeight)
        
        self.view.addSubview(buttonSum)
        self.view.addSubview(buttonChoose)
        self.view.addSubview(labelName)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "ФИО", message: "Введите ФИО", preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .cancel) { (action) in
            
            self.labelName.text = alertController.textFields?.first?.text

        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func buttonSumClicked (sender: UIButton) {
        let alert = UIAlertController(title: "Сложение", message: "Введите числа:", preferredStyle: .alert)
        let action = UIAlertAction(title: "Посчитать", style: .cancel) { (action) in
            var summary: Int? = 0
            
            if alert.textFields?.first?.text != nil && alert.textFields?.last != nil {
                summary = Int((alert.textFields?.first?.text)!)! + Int((alert.textFields?.last?.text)!)!
            }
            
            let alertResult = UIAlertController(title: "Результат сложения", message: "\((alert.textFields?.last?.text) ?? "") + \((alert.textFields?.first?.text)!) = \(summary!)", preferredStyle: .actionSheet)
            alertResult.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertResult, animated: true) {}
            
        }
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        self.present(alert, animated: true) {
            
        }
    }
    
    @objc func buttonChooseClicked (sender: UIButton) {
        let alert = UIAlertController(title: "А ну-ка угадай-ка!", message: "Отгадайте число от 1 до 10", preferredStyle: .alert)
        let action = UIAlertAction(title: "Узнать результат", style: .cancel) { (action) in
            let randomNum = Int.random(in: 0...10)
            var resString = "Вы не ввели значения"
            if let number = alert.textFields?.first?.text {
                if Int(number) == randomNum {
                    resString = "Поздравляем, вы угадали число!"
                } else {
                    resString = "К сожалению, вы не угадали число, правильный ответ - \(randomNum)"
                }
            }
            let alertResult = UIAlertController(title: "Результат", message: resString, preferredStyle: .alert)
            alertResult.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertResult, animated: true) {}
        }
            
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        self.present(alert, animated: true) {
            
        }
    }

}

