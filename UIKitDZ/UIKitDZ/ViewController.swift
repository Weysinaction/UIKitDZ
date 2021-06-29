//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var buttonSend = UIButton()
    var menuArray = ["Обувь", "Шорты", "Футболки"]
    var imageArray = [UIImage(named: "iu-8"),
                     UIImage(named: "iu-9"),
                     UIImage(named: "iu-10"),
                     UIImage(named: "iu-11"),
                     UIImage(named: "iu-12"),
                     UIImage(named: "iu-13"),
                     UIImage(named: "iu-14"),
                     UIImage(named: "iu-15"),
                     UIImage(named: "iu-16"),
                     UIImage(named: "iu-17"),
                     UIImage(named: "iu-18"),
                     UIImage(named: "iu-19")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //create segment
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 100, y: 700, width: 200, height: 30)
        self.view.addSubview(self.segmentControl)
        
        //create view
        self.imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        //create button
        self.buttonSend.frame = CGRect(x: 100, y: 800, width: 100, height: 50)
        //self.buttonSend.setTitle("Send")
        self.buttonSend.addTarget(self, action: #selector(sendPressed), for: .touchUpInside)
        self.view.addSubview(buttonSend)
        
        
        self.segmentControl.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
    }

    @objc func changeSegment (target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageArray[segmentIndex]
            
            //let pr = target.titleForSegment(at: segmentIndex)
            
        }
    }
    
    @objc func sendPressed (sender: UIButton) {
        
    }

}

