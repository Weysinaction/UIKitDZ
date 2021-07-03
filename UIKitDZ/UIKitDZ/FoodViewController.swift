//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    //MARK: public properties
    let imageViewPizza = UIImageView()
    let imageViewSushi = UIImageView()
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Food"
        self.view.backgroundColor = .white
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        initImageViews()
        initNavigationBar()
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
    
    func initNavigationBar() {
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "left-arrow"), style: .plain, target: self, action: #selector(barButtonBack(sender:)))
        
    }
    
    //MARK: Selectors
    
    @objc func barButtonBack(sender: UIBarButtonItem) {
            
    }
        
    @objc func imageTapped() {
        let viewController = PizzaViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
