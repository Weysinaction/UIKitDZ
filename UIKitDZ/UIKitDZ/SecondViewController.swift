//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 02.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SecondView"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
        //self.navigationController?.popViewController(animated: true)
        //Получаем текущий массив контроллеров
        var currentControllerArray = self.navigationController?.viewControllers
        
        //Удаляем последний контроллер
        currentControllerArray?.removeLast()

        //Присвоим
        if let newController = currentControllerArray {
            self.navigationController?.viewControllers = newController
        }
    }
}
