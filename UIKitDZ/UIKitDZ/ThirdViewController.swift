//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 24.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

    let buttonCancel = UIButton()
    let buttonAdd = UIButton()
    let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    let buttonChange = UIButton()

    let dividerOne = UIView()
    let dividerTwo = UIView()
    let dividerThree = UIView()
    let dividerFour = UIView()
    let dividerFive = UIView()

    let labelName = UILabel()
    let textField = UITextField()

    let labelDate = UILabel()
    let datePicker = UIDatePicker()

    let ageLabel = UILabel()
    let agePicker = UIPickerView()

    let sexLabel = UILabel()
    let sexPicker = UIPickerView()
    
    let instLabel = UILabel()
    let instField = UITextField()

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        
        //adding header views
        self.view.backgroundColor = .white
        self.view.addSubview(buttonCancel)
        self.view.addSubview(buttonAdd)
        self.view.addSubview(imageView)
        self.view.addSubview(buttonChange)
        
        //Adding fields with information about user
        self.view.addSubview(labelName)
        self.view.addSubview(textField)
        self.view.addSubview(labelDate)
        self.view.addSubview(datePicker)
        self.view.addSubview(ageLabel)
        self.view.addSubview(agePicker)
        self.view.addSubview(sexLabel)
        self.view.addSubview(sexPicker)
        self.view.addSubview(instLabel)
        self.view.addSubview(instField)
        
        //adding dividers
        self.view.addSubview(dividerOne)
        self.view.addSubview(dividerTwo)
        self.view.addSubview(dividerThree)
        self.view.addSubview(dividerFour)
        self.view.addSubview(dividerFive)
        
        
        
    }
    

    func configureViews() {
        buttonCancel.setTitle("Отмена", for: .normal)
        buttonCancel.frame = CGRect(x: 10, y: 30, width: 100, height: 30)
        buttonCancel.setTitleColor(.systemBlue, for: .normal)
        buttonCancel.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        buttonAdd.setTitle("Добавить", for: .normal)
        buttonAdd.frame = CGRect(x: 300, y: 30, width: 100, height: 30)
        buttonAdd.setTitleColor(.systemBlue, for: .normal)
        buttonAdd.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        imageView.frame = CGRect(x: 130, y: 70, width: 150, height: 150)
        
        buttonChange.setTitle("Изменить фото", for: .normal)
        buttonChange.frame = CGRect(x: 110, y: 240, width: 200, height: 30)
        buttonChange.setTitleColor(.systemBlue, for: .normal)
        
        
        labelName.text = "Имя"
        labelName.frame = CGRect(x: 30, y: 300, width: 150, height: 30)
        textField.placeholder = "Введите имя"
        textField.frame = CGRect(x: 30, y: 330, width: 150, height: 30)
        dividerOne.backgroundColor = .opaqueSeparator
        dividerOne.frame = CGRect(x: 30, y: 361, width: 300, height: 1)
        
        labelDate.text = "Дата"
        labelDate.frame = CGRect(x: 30, y: 380, width: 150, height: 30)
        datePicker.frame = CGRect(x: 30, y: 400, width: 320, height: 50)
        datePicker.datePickerMode = .date
        //dividerTwo.backgroundColor = .opaqueSeparator
        //dividerTwo.frame = CGRect(x: 30, y: 441, width: 300, height: 1)
        
        ageLabel.text = "Возраст"
        ageLabel.frame = CGRect(x: 30, y: 461, width: 150, height: 30)
        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.frame = CGRect(x: 30, y: 481, width: 300, height: 50)
        
        sexLabel.text = "Пол"
        sexLabel.frame = CGRect(x: 30, y: 541, width: 150, height: 30)
        sexPicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.frame = CGRect(x: 30, y: 561, width: 300, height: 50)
        
        instLabel.text = "Instagram"
        instLabel.frame = CGRect(x: 30, y: 621, width: 150, height: 30)
        instField.placeholder = "Добавить"
        instField.frame = CGRect(x: 30, y: 651, width: 150, height: 30)
        instField.addTarget(self, action: #selector(tapOnInst), for: .touchDown)
        dividerFive.backgroundColor = .opaqueSeparator
        dividerFive.frame = CGRect(x: 30, y: 681, width: 300, height: 1)
    }
    @objc func tapOnInst() {
        let alertController = UIAlertController(title: "Введите username instagram", message: "", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (actionCancel) in
            
        }
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (actionOk) in
            if let inst = alertController.textFields?.first?.text {
                instField.text = "@" + inst
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonTap() {
        dismiss(animated: true, completion: nil)
    }

}

extension ThirdViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case agePicker:
            return 150
        case sexPicker:
            return 2
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           switch pickerView {
           case agePicker:
               return "\(row)"
           case sexPicker:
            switch row {
            case 0:
                return "Мужской"
            case 1:
                return "Женский"
            default:
                return ""
            }
           default:
               return ""
           }
    }
}

