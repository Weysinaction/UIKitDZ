//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
    }

    func setupTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 0)
        tabBarItem.badgeColor = .lightGray
        
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .black
    }

}

