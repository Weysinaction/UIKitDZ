//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 24.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    

    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let daysLabel = UILabel()
    let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    let nameLabelTwo = UILabel()
    let descriptionLabelTwo = UILabel()
    let daysLabelTwo = UILabel()
    let imageViewTwo = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    let nameLabelThree = UILabel()
    let descriptionLabelThree = UILabel()
    let daysLabelThree = UILabel()
    let imageViewThree = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Birthday"
        self.view.backgroundColor = .systemBackground
        
        configureViews()
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(daysLabel)
        
        self.view.addSubview(nameLabelTwo)
        self.view.addSubview(descriptionLabelTwo)
        self.view.addSubview(imageViewTwo)
        self.view.addSubview(daysLabelTwo)
        
        self.view.addSubview(nameLabelThree)
        self.view.addSubview(descriptionLabelThree)
        self.view.addSubview(imageViewThree)
        self.view.addSubview(daysLabelThree)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(openEditor))
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, landscapeImagePhone: .none, style: .plain, target: self, action: #selector(openEditor))
       
    }
    
    @objc private func openEditor() {
        let thirdViewController = ThirdViewController()
        self.navigationController?.present(thirdViewController, animated: true, completion: nil)
    }
    
    func configureViews() {
        //сonfifure first bundle of view
        nameLabel.text = "Jeremy"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.frame = CGRect(x: 80, y: 90, width: 100, height: 50)
        
        descriptionLabel.text = "10 марта, в среду исполнится 25 лет"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.frame = CGRect(x: 80, y: 110, width: 300, height: 50)
        
        daysLabel.text = "18 дней"
        daysLabel.font = UIFont.boldSystemFont(ofSize: 18)
        daysLabel.frame = CGRect(x: 320, y: 90, width: 100, height: 50)
        
        imageView.frame = CGRect(x: 20, y: 100, width: 50, height: 50)
        
        //configure second bundle of views
        
        nameLabelTwo.text = "Maria Lui"
        nameLabelTwo.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabelTwo.frame = CGRect(x: 80, y: 160, width: 100, height: 50)
        
        descriptionLabelTwo.text = "30 марта, в четверг исполнится 20 лет"
        descriptionLabelTwo.font = UIFont.systemFont(ofSize: 14)
        descriptionLabelTwo.frame = CGRect(x: 80, y: 180, width: 300, height: 50)
        
        daysLabelTwo.text = "28 дней"
        daysLabelTwo.font = UIFont.boldSystemFont(ofSize: 18)
        daysLabelTwo.frame = CGRect(x: 320, y: 160, width: 100, height: 50)
        
        imageViewTwo.frame = CGRect(x: 20, y: 170, width: 50, height: 50)
        
        //configure third bundle of views
        
        nameLabelThree.text = "Jony Stark"
        nameLabelThree.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabelThree.frame = CGRect(x: 80, y: 220, width: 100, height: 50)
        
        descriptionLabelThree.text = "20 апреля, в субботу исполнится 25 лет"
        descriptionLabelThree.font = UIFont.systemFont(ofSize: 14)
        descriptionLabelThree.frame = CGRect(x: 80, y: 240, width: 300, height: 50)
        
        daysLabelThree.text = "53 дня"
        daysLabelThree.font = UIFont.boldSystemFont(ofSize: 18)
        daysLabelThree.frame = CGRect(x: 320, y: 220, width: 100, height: 50)
        
        imageViewThree.frame = CGRect(x: 20, y: 230, width: 50, height: 50)
    }

}
