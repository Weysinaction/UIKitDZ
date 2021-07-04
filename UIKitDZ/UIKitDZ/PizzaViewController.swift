//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class PizzaViewController: UIViewController {

    //MARK: private properties
    private let imageViewPepperoni = UIImageView()
    private let imageViewMargarita = UIImageView()
    private let labelPepperoni = UILabel()
    private let labelMargarita = UILabel()
    private let buttonPlusOne = UIButton()
    private let buttonPlusTwo = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pizza"
        self.view.backgroundColor = .white
        initImageViews()
        initLabels()
        initButtons()
        initNavigationBar()
        
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Methods
    
    func initNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(barButtonBack(sender:)))
        
    }
    
    func initImageViews() {
        imageViewPepperoni.image = UIImage(named: "pizza1")
        imageViewPepperoni.frame = CGRect(x: 20, y: 150, width: 100, height: 100)
        self.view.addSubview(imageViewPepperoni)
        
        imageViewMargarita.image = UIImage(named: "pizza2")
        imageViewMargarita.frame = CGRect(x: 20, y: 350, width: 100, height: 100)
        self.view.addSubview(imageViewMargarita)
        
    }
    
    func initLabels() {
        labelPepperoni.frame = CGRect(x: 150, y: 170, width: 260, height: 50)
        labelPepperoni.text = "Пепперони"
        labelPepperoni.textColor = .systemBlue
        self.view.addSubview(labelPepperoni)
        
        labelMargarita.frame = CGRect(x: 150, y: 370, width: 260, height: 50)
        labelMargarita.text = "Маргарита"
        labelMargarita.textColor = .systemBlue
        self.view.addSubview(labelMargarita)
    }
    
    func initButtons() {
        buttonPlusOne.frame = CGRect(x: 330, y: 175, width: 40, height: 40)
        //buttonPlusOne.setImage(UIImage(named: "add"), for: .normal)
        buttonPlusOne.setTitle("+", for: .normal)
        buttonPlusOne.setTitleColor(.white, for: .normal)
        buttonPlusOne.backgroundColor = .systemOrange
        buttonPlusOne.addTarget(self, action: #selector (buttonTapped(sender:)) , for: .touchUpInside)
        buttonPlusOne.backgroundColor = .orange
        buttonPlusOne.layer.cornerRadius = 12
        self.view.addSubview(buttonPlusOne)
        
        buttonPlusTwo.frame = CGRect(x: 330, y: 375, width: 40, height: 40)
        buttonPlusTwo.setTitle("+", for: .normal)
        buttonPlusTwo.setTitleColor(.white, for: .normal)
        buttonPlusTwo.backgroundColor = .systemOrange
        buttonPlusTwo.layer.cornerRadius = 12
        buttonPlusTwo.addTarget(self, action: #selector (buttonTapped(sender:)) , for: .touchUpInside)
        self.view.addSubview(buttonPlusTwo)
    }
    
    //MARK: Selectors
    @objc func buttonTapped(sender: UIButton) {
        let viewController = IngredientsViewController()
        
        switch sender {
        case buttonPlusOne:
            viewController.ingredientsArray = ["Пепперони\n"]
            if let image =  imageViewPepperoni.image {
                viewController.pizzaImage = image
            }
        case buttonPlusTwo:
            viewController.ingredientsArray = ["Маргарита\n"]
            if let image =  imageViewMargarita.image {
                viewController.pizzaImage = image
            }
        default:
            break
        }
        self.navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    @objc func barButtonBack(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

}
