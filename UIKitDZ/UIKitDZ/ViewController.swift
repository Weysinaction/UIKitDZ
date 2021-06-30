//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//


// 1) Потренируйтесь писать UIActivity кодом: сделайте его
//вызов по нажатию на кнопку, затем вызов по прокрутке
//UIPicker(например, в пикере 3 раздела. Переходите на 3
//и вызываете UIPicker).
//Придумать свои фишки - где можно использовать
//UIActivity.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var buttonShare = UIButton()
    var textField = UITextField()
    var segmentNameArray = ["First", "Second", "Share"]
    var segmentController = UISegmentedControl()
    var pickerView = UIPickerView()
    var activityViewController: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createButton()
        createSegmentController()
        createPickerView()
    }

    //MARK: - Methods
    
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
        
    }
    
    func createButton () {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.buttonShare.setTitle("Share", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(buttonShareTapped), for: .touchUpInside)
        self.view.addSubview(buttonShare)
    }
    
    @objc func buttonShareTapped(sender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let message = "Сначала введите текст, потом нажмите кнопку!"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel) { action in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
    
    func createSegmentController() {
        self.segmentController = UISegmentedControl(items: segmentNameArray)
        self.segmentController.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        let _ = UIAction { action in
            self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        }
        self.view.addSubview(segmentController)
    }
    
    func createPickerView() {
        self.pickerView.frame = CGRect(x: 70, y: 600, width: 200, height: 60)
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.view.addSubview(pickerView)
        //self.pickerView
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("picker row selected")
    }
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()

        return true
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "First"
        case 1:
            return "Second"
        case 2:
            return "Third"
        case 3:
            return "Fourth"
        case 4:
            return "Fifth"
        default:
            return ""
        }
        
    }
}
