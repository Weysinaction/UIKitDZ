//
//  IngredientsViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {

    //MARK: public properties
    let imageViewPizza = UIImageView()
    let labelHeader = UILabel()
    let labelFirstIng = UILabel()
    let labelSecondIng = UILabel()
    let labelThirdIng = UILabel()
    let labelFourthIng = UILabel()
    let switchOne = UISwitch()
    let switchTwo = UISwitch()
    let switchThree = UISwitch()
    let switchFour = UISwitch()
    let buttonAdd = UIButton()
    var pizzaViewController = PizzaViewController()
    var pizzaImage = UIImage()
    var ingredientsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pizza"
        self.view.backgroundColor = .red
        self.view.backgroundColor = .white
        
        initLabels()
        initImageView(image: pizzaImage)
        initButton()
        initSwitches()
    }
    
    //MARK: Methods
    
    func initLabels() {
        labelFirstIng.frame = CGRect(x: 50, y: 400, width: 260, height: 50)
        labelFirstIng.text = "Сыр моцарелла"
        labelFirstIng.textColor = .gray
        self.view.addSubview(labelFirstIng)
        
        labelSecondIng.frame = CGRect(x: 50, y: 470, width: 260, height: 50)
        labelSecondIng.text = "Ветчина"
        labelSecondIng.textColor = .gray
        self.view.addSubview(labelSecondIng)
        
        labelThirdIng.frame = CGRect(x: 50, y: 540, width: 260, height: 50)
        labelThirdIng.text = "Грибы"
        labelThirdIng.textColor = .gray
        self.view.addSubview(labelThirdIng)
        
        labelFourthIng.frame = CGRect(x: 50, y: 610, width: 260, height: 50)
        labelFourthIng.text = "Маслины"
        labelFourthIng.textColor = .gray
        self.view.addSubview(labelFourthIng)
    }
    
    func initImageView(image: UIImage) {
        imageViewPizza.image = image
        imageViewPizza.frame = CGRect(x: 90, y: 100, width: 250, height: 250)
        self.view.addSubview(imageViewPizza)
    }
    
    func initSwitches() {
        switchOne.frame = CGRect(x: 330, y: 410, width: 30, height: 30)
        switchOne.isOn = false
        self.view.addSubview(switchOne)
        
        switchTwo.frame = CGRect(x: 330, y: 480, width: 30, height: 30)
        switchTwo.isOn = false
        self.view.addSubview(switchTwo)
        
        switchThree.frame = CGRect(x: 330, y: 550, width: 30, height: 30)
        switchThree.isOn = false
        self.view.addSubview(switchThree)
        
        switchFour.frame = CGRect(x: 330, y: 620, width: 30, height: 30)
        switchFour.isOn = false
        self.view.addSubview(switchFour)
    }
    
    func initButton() {
        buttonAdd.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        buttonAdd.setTitle("Добавить", for: .normal)
        buttonAdd.addTarget(self, action: #selector (buttonTapped(sender:)) , for: .touchUpInside)
        buttonAdd.backgroundColor = .systemOrange
        buttonAdd.layer.cornerRadius = 12
        self.view.addSubview(buttonAdd)
    }
    
    func addIngredients() {
        if switchOne.isOn {
            if let ingr = labelFirstIng.text {
                ingredientsArray.append(ingr + "\n")
            }
        }
        if switchTwo.isOn {
            if let ingr = labelSecondIng.text {
                ingredientsArray.append(ingr + "\n")
            }
        }
        if switchThree.isOn {
            if let ingr = labelThirdIng.text {
                ingredientsArray.append(ingr + "\n")
            }
        }
        if switchFour.isOn {
            if let ingr = labelFourthIng.text {
                ingredientsArray.append(ingr + "\n")
            }
        }
    }
    
    //MARK: Selectors
    @objc func buttonTapped(sender: UIButton) {
        let viewController = PaymentViewController()
        addIngredients()
        viewController.ingredientsArray = self.ingredientsArray
        let navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
   

}
