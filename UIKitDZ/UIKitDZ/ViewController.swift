//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: UIButton
    let button = UIButton()
    
    //MARK: public variables
    var navController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = self.view.center
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        button.setTitle("Products", for: .normal)
        button.backgroundColor = .darkGray
        self.view.addSubview(button)
    }
    
    //MARK: Selectors
    @objc func buttonTapped(sender: UIButton) {
        let viewController = AuthentViewController()
        self.navController = UINavigationController.init(rootViewController: viewController)
        self.present(viewController, animated: true, completion: nil)
    }
    
}

