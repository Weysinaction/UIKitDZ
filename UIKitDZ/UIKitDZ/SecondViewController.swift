//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 06.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {

    //MARK: private properties
    let imageView = UIImageView()
    let label = UILabel()
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelfView()
        configureImageView()
        configureLabel()
    }
    
    //MARK: public methods
    //Set settings to main view
    func configureLabel() {
        self.label.frame = CGRect(x: 50, y: 150, width: 300, height: 100)
        self.label.textAlignment = .center
        self.label.text = "Гляньте-ка лучше на котика))"
        self.label.textColor = .black
        self.label.numberOfLines = 2
        self.label.font = self.label.font.withSize(27)
        self.view.addSubview(label)
    }
    
    //Configure main view
    func configureSelfView() {
        self.view.backgroundColor = .white
        self.title = "SecondVC"
        configureTabBarItem()
    }
    
    //Configure image view
    func configureImageView() {
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        imageView.center = self.view.center
        imageView.image = UIImage(named: "iu-22")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        self.view.addSubview(imageView)
    }
    
    //add tab bar item
    func configureTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        self.tabBarItem = tabBarItem
    }
}
