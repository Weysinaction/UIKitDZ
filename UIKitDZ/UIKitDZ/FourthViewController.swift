//
//  FourthViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 11.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
    }
    
    func setupTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)
        tabBarItem.badgeColor = .lightGray
        
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .black
    }

}
