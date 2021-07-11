//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myImageView = UIImageView()
    let macBookImage = UIImage(named: "macbook")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = macBookImage
        myImageView.center = self.view.center
        self.view.addSubview(myImageView)
    }


}

