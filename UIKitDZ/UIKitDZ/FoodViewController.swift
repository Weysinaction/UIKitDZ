//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class FoodViewController: UIViewController {

    //MARK: private properties
    private let imageViewPizza = UIImageView()
    private let imageViewSushi = UIImageView()
    private var tapGesture = UITapGestureRecognizer()
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Food"
        self.view.backgroundColor = .white
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        initImageViews()
    }
    
    //MARK: Methods
    
    func initImageViews() {
        imageViewPizza.image = UIImage(named: "pizza")
        imageViewPizza.frame = CGRect(x: 90, y: 200, width: 250, height: 250)
        imageViewPizza.isUserInteractionEnabled = true
        imageViewPizza.addGestureRecognizer(tapGesture)
        self.view.addSubview(imageViewPizza)
        
        imageViewSushi.image = UIImage(named: "sushi")
        imageViewSushi.frame = CGRect(x: 90, y: 500, width: 250, height: 250)
        self.view.addSubview(imageViewSushi)
        
    }
    
    //MARK: Selectors
    @objc func imageTapped() {
        let viewController = PizzaViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
