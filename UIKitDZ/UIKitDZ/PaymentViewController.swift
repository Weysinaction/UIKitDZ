//
//  PaymentViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    //MARK: public properties
    let labelOrder = UILabel()
    let labelOrderDetail = UILabel()
    let labelCard = UILabel()
    let labelCash = UILabel()
    let buttonPay = UIButton()
    let switchCard = UISwitch()
    let switchCash = UISwitch()
    var ingredientsArray: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Оплата"
        self.view.backgroundColor = .systemBackground
        initLabels()
        initButton()
        initSwitches()
        initOrder()
    
    }
    
    //MARK: Methods
    
    func initLabels() {
        labelOrder.frame = CGRect(x: 10, y: 120, width: 260, height: 50)
        labelOrder.text = "Ваш заказ:"
        labelOrder.font = UIFont(name: labelOrder.font.fontName, size: 27)
        labelOrder.textColor = .gray
        self.view.addSubview(labelOrder)
        
        labelOrderDetail.frame = CGRect(x: 10, y: 140, width: 400, height: 300)
        labelOrderDetail.font = labelOrderDetail.font.withSize(34)
        labelOrderDetail.textColor = .gray
        labelOrderDetail.numberOfLines = 5
        self.view.addSubview(labelOrderDetail)
        
        labelCard.frame = CGRect(x: 80, y: 550, width: 260, height: 50)
        labelCard.text = "Оплата картой"
        labelCard.font = labelCard.font .withSize(24)
        labelCard.textColor = .gray
        self.view.addSubview(labelCard)
        
        labelCash.frame = CGRect(x: 80, y: 600, width: 260, height: 50)
        labelCash.text = "Наличными"
        labelCash.font = labelCard.font .withSize(24)
        labelCash.textColor = .gray
        self.view.addSubview(labelCash)
    }
    
    func initButton() {
        buttonPay.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        buttonPay.tintColor = .white
        buttonPay.setTitle("Pay", for: .normal)
        buttonPay.setTitleColor(.white, for: .normal)
        buttonPay.setImage(UIImage(systemName: "applelogo"), for: .normal)
        buttonPay.addTarget(self, action: #selector (buttonTapped(sender:)) , for: .touchUpInside)
        buttonPay.backgroundColor = .black
        buttonPay.layer.cornerRadius = 12
        self.view.addSubview(buttonPay)
    }
    
    func initSwitches() {
        switchCard.frame = CGRect(x: 260, y: 560, width: 30, height: 30)
        switchCard.isOn = true
        switchCard.addTarget(self, action: #selector(switchCardChange(sender:)), for: .touchUpInside)
        self.view.addSubview(switchCard)
        
        switchCash.frame = CGRect(x: 260, y: 610, width: 30, height: 30)
        switchCash.isOn = false
        switchCash.addTarget(self, action: #selector(switchCashChange(sender:)), for: .touchUpInside)
        self.view.addSubview(switchCash)
    }
    
    //Достаем ингредиенты и выбранную пиццу из массива
    func initOrder() {
        var ingredients = ""
        var counter = 1
        print(ingredientsArray)
        for ingr in ingredientsArray {
            ingredients += String(counter) + " " + ingr
            counter += 1
        }
        labelOrderDetail.text = ingredients
    }

    //MARK: selectors
    @objc func switchCardChange(sender: UISwitch) {
        if switchCard.isOn {
            switchCash.isOn = false
        } else {
            switchCash.isOn = true
        }
    }
    
    @objc func switchCashChange(sender: UISwitch) {
        if switchCash.isOn {
            switchCard.isOn = false
        } else {
            switchCard.isOn = true
        }
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Заказ оплачен!", message: "Ваш заказ доставят в течение 15 минут! Приятного аппетита", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            let viewController = FoodViewController()
            let navController = UINavigationController(rootViewController: viewController)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}
