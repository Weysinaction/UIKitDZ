//
//  MarksViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 08.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class MarksViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet private var categorySegmentController: UISegmentedControl!
    @IBOutlet private var firstImage: UIImageView!
    @IBOutlet private var secondImage: UIImageView!
    @IBOutlet private var thirdImage: UIImageView!
    @IBOutlet private var firstLabel: UILabel!
    @IBOutlet private var secondLabel: UILabel!
    @IBOutlet private var thirdLabel: UILabel!
    
    //MARK: private properties
    private let imagesCars: [UIImage?] = [UIImage(named: "mustang"), UIImage(named: "challenger"), UIImage(named: "charger"),
                                  UIImage(named: "sportCarOne"), UIImage(named: "sportCarTwo"), UIImage(named: "cportCarThree")]
    private let labelsArray = ["Ford Mustang", "Dodge Chalenger", "Dodge Charger",
                       "Lamborghini Hurracan", "Koenigsegg", "Marussia"]
    
    //MARK: private methods
    private func loadImagesAndLabels(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            firstImage.image = imagesCars[0]
            secondImage.image = imagesCars[1]
            thirdImage.image = imagesCars[2]
            
            firstLabel.text = labelsArray[0]
            secondLabel.text = labelsArray[1]
            thirdLabel.text = labelsArray[2]
        case 1:
            firstImage.image = imagesCars[3]
            secondImage.image = imagesCars[4]
            thirdImage.image = imagesCars[5]
            
            firstLabel.text = labelsArray[3]
            secondLabel.text = labelsArray[4]
            thirdLabel.text = labelsArray[5]
        default:
            break
        }
        
    }

    //MARK: IBAction
    @IBAction private func segmentChanged(_ sender: UISegmentedControl) {
        loadImagesAndLabels(segmentIndex: sender.selectedSegmentIndex)
    }
    
}
