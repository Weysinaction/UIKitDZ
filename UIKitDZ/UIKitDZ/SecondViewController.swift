//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 04.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var buttonConfigure: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
    }
    
    //MARK: Methods
    //Make button rounded
    func configureButton() {
        buttonConfigure.layer.cornerRadius = 15
    }

}
