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
        self.title = "FirstVC"
        self.navigationItem.title = "FirstVC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }


}

