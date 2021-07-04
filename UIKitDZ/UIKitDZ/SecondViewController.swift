//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 04.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVC"
        self.navigationItem.title = "SecondVC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        self.tabBarItem = tabBarItem
        
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
