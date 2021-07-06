//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: private variables
    private let labelMain = UILabel()
    private let labelMinFontSize = UILabel()
    private let labelMaxFontSize = UILabel()
    private let pickerViewColor = UIPickerView()
    private let pickerViewRows = UIPickerView()
    private let slider = UISlider()
    private let colorsArray = ["Black", "Orange", "Blue", "Red"]
    private let rowsArray = ["1", "2", "3", "4", "5"]
    var colorsGesture = UITapGestureRecognizer()
    var rowsGesture = UITapGestureRecognizer()
    
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FirstVC"
        configureSelfView()
        configureRightBarButtonItem()
        configureLabel()
        configurePickerViews()
        configureSlider()
        
    }
    
    //MARK: public methods
    //Create label
    func configureLabel() {
        self.labelMain.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        self.labelMain.textAlignment = .center
        self.labelMain.text = "Some text"
        self.labelMain.textColor = .black
        self.labelMain.shadowOffset = CGSize(width: 1, height: 2)
        self.labelMain.shadowColor = .darkGray
        self.view.addSubview(labelMain)
        
        self.labelMinFontSize.frame = CGRect(x: 30, y: 700, width: 50, height: 50)
        self.labelMinFontSize.textAlignment = .center
        self.labelMinFontSize.text = "1"
        self.labelMaxFontSize.font = labelMaxFontSize.font.withSize(5)
        self.labelMinFontSize.textColor = .black
        self.view.addSubview(labelMinFontSize)
        
        self.labelMaxFontSize.frame = CGRect(x: 350, y: 700, width: 50, height: 50)
        self.labelMaxFontSize.textAlignment = .center
        self.labelMaxFontSize.text = "35"
        self.labelMaxFontSize.font = labelMaxFontSize.font.withSize(35)
        self.labelMaxFontSize.textColor = .black
        self.view.addSubview(labelMaxFontSize)
        
    }
    
    //create UISlider
    func configureSlider() {
        self.slider.frame = CGRect(x: 75, y: 705, width: 250, height: 35)
        self.slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        self.slider.minimumValue = 1
        self.slider.maximumValue = 35
        self.slider.value = 17
        self.view.addSubview(slider)
    }
    
    //Create picker views and subscribe them on delegate
    func configurePickerViews() {
        self.pickerViewColor.frame = CGRect(x: 30, y: 500, width: 150, height: 150)
        self.pickerViewColor.dataSource = self
        self.pickerViewColor.delegate = self
        colorsGesture = UITapGestureRecognizer(target: self, action: #selector(colorChanged(sender:)))
        self.pickerViewColor.addGestureRecognizer(colorsGesture)
        self.view.addSubview(pickerViewColor)
        
        self.pickerViewRows.frame = CGRect(x: 240, y: 500, width: 150, height: 150)
        self.pickerViewRows.dataSource = self
        self.pickerViewRows.delegate = self
        self.pickerViewRows.isUserInteractionEnabled = true
        self.rowsGesture = UITapGestureRecognizer(target: self, action: #selector(rowsChanged(sender:)))
        self.pickerViewColor.addGestureRecognizer(rowsGesture)
        self.view.addSubview(pickerViewRows)
    }
    
    //Set settings to main view
    func configureSelfView() {
        self.view.backgroundColor = .white
        configureTabBarItem()
    }
    
    //Add tab bar item
    func configureTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.tabBarItem = tabBarItem
    }
    //Add button "+" to ToolBar
    func configureRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped(sender:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .systemOrange
    }
    
    //Call alert to add a text
    func callAlert() {
        let alert = UIAlertController(title: "Добавить", message: "Введите новый текст.", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            if let string = alert.textFields?.first?.text {
                self.labelMain.text = string
            }
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //Set color by element of colors array
    func setColor(colorString: String) {
        switch colorString {
        case "Black":
            labelMain.textColor = .black
        case "Orange":
            labelMain.textColor = .orange
        case "Blue":
            labelMain.textColor = .blue
        case "Red":
            labelMain.textColor = .red
        default:
            break
        }
    }
    
    //MARK: Selectors
    //add action to button in toolbar
    @objc func barButtonTapped(sender: UIBarButtonItem) {
        callAlert()
    }
    
    @objc func colorChanged(sender: UITapGestureRecognizer) {
        print("color changed")
    }
    
    @objc func rowsChanged(sender: UITapGestureRecognizer) {
        print("rows changed")
        
    }
    
    @objc func sliderChanged(sender: UISlider) {
        self.labelMain.font = self.labelMain.font.withSize(CGFloat(sender.value))
    }
}

//MARK: Extensions
//Add extensions to subscribe class to protocols
//Configure picker view
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerViewColor:
            setColor(colorString: colorsArray[row])
        case pickerViewRows:
            labelMain.numberOfLines = Int(rowsArray[row]) ?? 1
        default:
            break
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerViewColor:
            return 4
        case pickerViewRows:
            return 5
        default:
            return 0
        }
    }
    
    
}

//Set content of picker views
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerViewColor:
            return colorsArray[row]
        case pickerViewRows:
            return rowsArray[row]
        default:
            return ""
        }
    }
}
