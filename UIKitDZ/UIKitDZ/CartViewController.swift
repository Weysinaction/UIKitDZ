//
//  CartViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 29.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    var imageViewFirst = UIImageView()
    var imageViewSecond = UIImageView()
    var imageViewThird = UIImageView()
    var imageViewFourth = UIImageView()
    var labelFirstItem = UILabel()
    var labelSecondItem = UILabel()
    var labelThirdItem = UILabel()
    var labelFourthItem = UILabel()
    var deliveryLabel = UILabel()
    var deliverySwitch = UISwitch()
    var purchaseButton = UIButton()
    var nameArray: [String] = []
    var pageIndex = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        //Create imageViews
        self.imageViewFirst.frame = CGRect(x: 20, y: 250, width:  100, height: 100)
        //self.imageViewFirst.image = self.imageArray[0]
        self.view.addSubview(self.imageViewFirst)
        
        self.imageViewSecond.frame = CGRect(x: 20, y: 370, width:  100, height: 100)
        //self.imageViewSecond.image = self.imageArray[1]
        self.view.addSubview(self.imageViewSecond)
        
        self.imageViewThird.frame = CGRect(x: 20, y: 490, width:  100, height: 100)
        //self.imageViewThird.image = self.imageArray[2]!
        self.view.addSubview(self.imageViewThird)
        
        self.imageViewFourth.frame = CGRect(x: 20, y: 610, width:  100, height: 100)
        //self.imageViewFourth.image = self.imageArray[3]!
        self.view.addSubview(self.imageViewFourth)
        
        //Calculate index of elements from page
        switch pageIndex {
        case 0:
            index = 0
        case 1:
            index = 4
        case 2:
            index = 8
        default:
            break
        }
        
        //create labels
        self.labelFirstItem.frame = CGRect(x: 20, y: 150, width: 200, height: 30)
        self.labelFirstItem.text = nameArray[index]
        self.labelFirstItem.textAlignment = .left
        self.labelFirstItem.font = self.labelFirstItem.font.withSize(26)
        self.view.addSubview(labelFirstItem)
        
        self.labelSecondItem.frame = CGRect(x: 20, y: 200, width: 200, height: 30)
        self.labelSecondItem.text = nameArray[index + 1]
        self.labelSecondItem.textAlignment = .left
        self.labelSecondItem.font = self.labelSecondItem.font.withSize(26)
        self.view.addSubview(labelSecondItem)
        
        self.labelThirdItem.frame = CGRect(x: 20, y: 250, width: 200, height: 30)
        self.labelThirdItem.text = nameArray[index + 2]
        self.labelThirdItem.textAlignment = .left
        self.labelThirdItem.font = self.labelThirdItem.font.withSize(26)
        self.view.addSubview(labelThirdItem)
        
        self.labelFourthItem.frame = CGRect(x: 20, y: 300, width: 200, height: 30)
        self.labelFourthItem.text = nameArray[index + 3]
        self.labelFourthItem.textAlignment = .left
        self.labelFourthItem.font = self.labelFourthItem.font.withSize(26)
        self.view.addSubview(labelFourthItem)
        
        self.deliveryLabel.frame = CGRect(x: 20, y: 420, width: 150, height: 30)
        self.deliveryLabel.text = "Доставка"
        self.deliveryLabel.textAlignment = .left
        self.deliveryLabel.font = self.deliveryLabel.font.withSize(21)
        self.view.addSubview(deliveryLabel)
        
        //create switch
        self.deliverySwitch.frame = CGRect(x: 150, y: 420, width: 180, height: 30)
        self.deliverySwitch.isOn = false
        self.view.addSubview(deliverySwitch)
        
        //Create button
        self.purchaseButton.frame = CGRect(x: 110, y: 750, width: 200, height: 50)
        self.purchaseButton.backgroundColor = .darkGray
        self.purchaseButton.layer.cornerRadius = 8
        self.purchaseButton.setTitle("Купить", for: .normal)
        self.purchaseButton.tintColor = .systemBackground
        self.purchaseButton.addTarget(self, action: #selector(purchasePressed), for: .touchUpInside)
        self.view.addSubview(purchaseButton)
    }
    
    @objc func purchasePressed (sender: UIButton) {
        if self.deliverySwitch.isOn {
            let alert = UIAlertController(title: "Внимание!", message: "Вы уверены, что хотите воспользоваться доставкой?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Да", style: .default) { action in
                print("Ура, заработаем еще и на доставке)))))))")
            }
            let actionTwo = UIAlertAction(title: "Нет", style: .cancel) { actionTwo in
                print("Эх, не заработаем на доставке(((")
            }
            alert.addAction(action)
            alert.addAction(actionTwo)
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    

}
