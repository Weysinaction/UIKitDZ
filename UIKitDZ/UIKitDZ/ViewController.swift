//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var displaySecondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "View Controller"
        
        let items = ["up", "down"]
        
        let segmentController = UISegmentedControl(items: items)
        segmentController.isMomentary = true
        segmentController.addTarget(self, action: #selector(segmentTapped(param:)), for: .valueChanged)
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                                 target: self,
                                                                 action: #selector(performAdd(sender:)))

        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(valueSwitched(param:)), for: .valueChanged)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
        
        
        
//        self.displaySecondButton = UIButton(type: .system)
//        self.displaySecondButton.setTitle("SecondVC", for: .normal)
//        self.displaySecondButton.sizeToFit()
//        self.displaySecondButton.center = self.view.center
//        self.displaySecondButton.addTarget(self, action: #selector(displaySecondButtonTapped), for: .touchUpInside)
//        self.view.addSubview(displaySecondButton)
    }
    
    @objc func segmentTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
    @objc func valueSwitched(param: UISwitch) {
        if param.isOn {
            print("isOn")
        } else {
            print("isOff")
        }
    }
    
    @objc func performAdd(sender: UIBarButtonItem) {
        print("add click")
    }
    //MARK: Method
    
    func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.contentMode = .scaleAspectFill
        
        let image = UIImage(named: "apple")
        
        imageView.image = image
        
        self.navigationItem.titleView = imageView
    }

//    @objc func displaySecondButtonTapped(sender: Any) {
//        let vc = SecondViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

}

