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
    var sizeSlider = UISlider()
    var imageViewFirst = UIImageView()
    var imageViewSecond = UIImageView()
    var imageViewThird = UIImageView()
    var imageViewFourth = UIImageView()
    var labelFirstItem = UILabel()
    var labelSecondItem = UILabel()
    var labelThirdItem = UILabel()
    var labelFourthItem = UILabel()
    var buttonSend = UIButton()
    var imageSize: CGFloat = 150
    var menuArray = ["Обувь", "Шорты", "Футболки"]
    var nameArray = ["Adidas supreme", "Balenciaga", "Comanchee Sport", "Autlet",
                     "Reebok", "Nike", "Lonsdale", "Puma",
                     "Armani Exchange", "Chanel", "Calvin Clein", "Off-white"]
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
        
        print(imageArray)
        
        self.view.backgroundColor = .systemBackground
        //create segment
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 60, y: 100, width: 300, height: 40)
        
        self.view.addSubview(self.segmentControl)
        //create Imageview
        
        self.imageViewFirst.frame = CGRect(x: 20, y: 250, width:  imageSize, height: imageSize)
        self.imageViewFirst.image = self.imageArray[0]
        self.view.addSubview(self.imageViewFirst)
        
        self.imageViewSecond.frame = CGRect(x: 250, y: 250, width:  imageSize, height: imageSize)
        self.imageViewSecond.image = self.imageArray[1]
        self.view.addSubview(self.imageViewSecond)
        
        self.imageViewThird.frame = CGRect(x: 20, y: 470, width:  imageSize, height: imageSize)
        self.imageViewThird.image = self.imageArray[2]
        self.view.addSubview(self.imageViewThird)
        
        self.imageViewFourth.frame = CGRect(x: 250, y: 470, width:  imageSize, height: imageSize)
        self.imageViewFourth.image = self.imageArray[3]
        self.view.addSubview(self.imageViewFourth)
        
        //create labels
        self.labelFirstItem.frame = CGRect(x: 20, y: 410, width: 200, height: 30)
        self.labelFirstItem.text = nameArray[0]
        self.labelFirstItem.textAlignment = .center
        self.view.addSubview(labelFirstItem)
        
        self.labelSecondItem.frame = CGRect(x: 250, y: 410, width: 200, height: 30)
        self.labelSecondItem.text = nameArray[1]
        self.labelFirstItem.textAlignment = .center
        self.view.addSubview(labelSecondItem)
        
        self.labelThirdItem.frame = CGRect(x: 20, y: 630, width: 200, height: 30)
        self.labelThirdItem.text = nameArray[2]
        self.labelFirstItem.textAlignment = .center
        self.view.addSubview(labelThirdItem)
        
        self.labelFourthItem.frame = CGRect(x: 250, y: 630, width: 200, height: 30)
        self.labelFourthItem.text = nameArray[3]
        self.labelFirstItem.textAlignment = .center
        self.view.addSubview(labelFourthItem)
        
        //Create slider
        self.sizeSlider.frame = CGRect(x: 100, y: 180, width: 200, height: 30)
        self.sizeSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        self.sizeSlider.maximumValue = 2
        self.sizeSlider.value = 1
        self.view.addSubview(sizeSlider)
        
        
        //create button
        self.buttonSend.frame = CGRect(x: 110, y: 750, width: 200, height: 50)
        self.buttonSend.backgroundColor = .darkGray
        self.buttonSend.layer.cornerRadius = 8
        buttonSend.setTitle("Добавить", for: .normal)
        self.buttonSend.tintColor = .systemBackground
        self.buttonSend.addTarget(self, action: #selector(sendPressed), for: .touchUpInside)
        self.view.addSubview(buttonSend)
        
        
        self.segmentControl.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
    }

    @objc func changeSegment (target: UISegmentedControl) {
        if target == segmentControl {
            var index = 0
            switch target.selectedSegmentIndex {
            case 0:
                index = 0
            case 1:
                index = 4
            case 2:
                index = 8
            default:
                break
            }
            self.imageViewFirst.image = self.imageArray[index]
            self.imageViewSecond.image = self.imageArray[index+1]
            self.imageViewThird.image = self.imageArray[index+2]
            self.imageViewFourth.image = self.imageArray[index+3]
            
            self.labelFirstItem.text = self.nameArray[index]
            self.labelSecondItem.text = self.nameArray[index+1]
            self.labelThirdItem.text = self.nameArray[index+2]
            self.labelFourthItem.text = self.nameArray[index+3]
            
            //let pr = target.titleForSegment(at: segmentIndex)
            
        }
    }
    
    @objc func sendPressed (sender: UIButton) {
        let cartViewController = CartViewController()
        cartViewController.pageIndex = segmentControl.selectedSegmentIndex
        cartViewController.nameArray = self.nameArray
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    @objc func sliderChanged(sender: UISlider) {
        if sender == sizeSlider {
            let value = sender.value
            self.imageViewFirst.frame = CGRect(x: 20, y: 250, width: imageSize * CGFloat(value), height: imageSize * CGFloat(value))
            self.imageViewSecond.frame = CGRect(x: 250, y: 250, width: imageSize * CGFloat(value), height: imageSize * CGFloat(value))
            self.imageViewThird.frame = CGRect(x: 20, y: 470, width: imageSize * CGFloat(value), height: imageSize * CGFloat(value))
            self.imageViewFourth.frame = CGRect(x: 250, y: 470, width: imageSize * CGFloat(value), height: imageSize * CGFloat(value))
            
            self.labelFirstItem.font =
                self.labelFirstItem.font.withSize(CGFloat(value) * 17)
            
            self.labelSecondItem.font =
                self.labelSecondItem.font.withSize(CGFloat(value) * 17)
            
            self.labelThirdItem.font =
                self.labelThirdItem.font.withSize(CGFloat(value) * 17)
            
            self.labelFourthItem.font =
                self.labelFourthItem.font.withSize(CGFloat(value) * 17)
        }
    }

}

