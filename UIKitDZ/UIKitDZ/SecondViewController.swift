//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 11.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
    }

    func setupTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        tabBarItem.badgeColor = .lightGray
        
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .black
    }
}
