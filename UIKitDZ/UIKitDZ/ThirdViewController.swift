//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 11.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    //MARK: private properties
    let searchLabel = UILabel()
    let searchTextField = UITextField()
    let recentViewedLabel = UILabel()
    let recentViewButton = UIButton()
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    let firstItemLabel = UILabel()
    let secondItemLabel = UILabel()
    let thirdItemLabel = UILabel()
    let requestVariablesLabel = UILabel()
    let airPodsLabel = UILabel()
    let appleCareLabel = UILabel()
    let beatsLabel = UILabel()
    let labelCompare = UILabel()
    let dividerOne = UIView()
    let dividerTwo = UIView()
    let dividerThree = UIView()
    let dividerFour = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
    }

    //MARK: public methods
    func setupTabBarItem() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        tabBarItem.badgeColor = .lightGray
        
        self.navigationController?.navigationBar.backgroundColor = .black
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .black
    }
    
    func setupLabels() {
        searchLabel.frame = CGRect(x: 10, y: 50, width: 100, height: 50)
        searchLabel.font = searchLabel.font.withSize(30)
        searchLabel.text = "Поиск"
        searchLabel.textColor = .white
        self.view.addSubview(searchLabel)
        
        recentViewedLabel.frame = CGRect(x: 10, y: 150, width: 300, height: 50)
        recentViewedLabel.font = searchLabel.font.withSize(27)
        recentViewedLabel.text = "Недавно просмотренные"
        self.view.addSubview(recentViewedLabel)
        
        requestVariablesLabel.frame = CGRect(x: 10, y: 500, width: 300, height: 50)
        requestVariablesLabel.font = searchLabel.font.withSize(27)
        requestVariablesLabel.text = "Варианты запросов"
        self.view.addSubview(requestVariablesLabel)
        
        airPodsLabel.frame = CGRect(x: 50, y: 550, width: 300, height: 50)
        airPodsLabel.font = searchLabel.font.withSize(20)
        airPodsLabel.text = "AirPods"
        self.view.addSubview(airPodsLabel)
        
        appleCareLabel.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        appleCareLabel.font = searchLabel.font.withSize(20)
        appleCareLabel.text = "AppleCare"
        self.view.addSubview(appleCareLabel)
        
        beatsLabel.frame = CGRect(x: 50, y: 650, width: 300, height: 50)
        beatsLabel.font = searchLabel.font.withSize(20)
        beatsLabel.text = "Beats"
        self.view.addSubview(beatsLabel)
        
        labelCompare.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        labelCompare.font = searchLabel.font.withSize(20)
        labelCompare.text = "Сравните модели iPhone"
        self.view.addSubview(labelCompare)
    }
}
