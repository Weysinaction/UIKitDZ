//
//  FourthViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 04.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        makeRoundedButtons()
    }
    
    //MARK: Methods
    //Делаем кнопки круглыми
    private func makeRoundedButtons() {
        cancelButton.layer.cornerRadius = 0.5 * cancelButton.bounds.size.width;
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width;
    }
}

//MARK: UIPickerViewDataSource
//Расширяем основной класс и добавляем методы для настройки PickerView
extension FourthViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
    
}

//MARK: UIPickerViewDelegate

extension FourthViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(row) + " ч"
        case 1:
            return String(row) + " м"
        case 2:
            return String(row) + " с"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var returnString = ""
        switch component {
        case 0:
            returnString = String(row) + " ч"
        case 1:
            returnString = String(row) + " ч"
        case 2:
            returnString = String(row) + " ч"
        default:
            returnString = ""
        }
        return NSAttributedString(string: returnString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}
