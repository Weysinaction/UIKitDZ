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
    @IBOutlet var categorySegmentController: UISegmentedControl!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    
    //MARK: private properties
    var imagesArray: [UIImage?] = [UIImage(named: "mustang"), UIImage(named: "challenger"), UIImage(named: "charger"),
                                  UIImage(named: "sportCarOne"), UIImage(named: "sportCarTwo"), UIImage(named: "cportCarThree")]
    var labelsArray = ["Ford Mustang", "Dodge Chalenger", "Dodge Charger",
                       "Lamborghini Hurracan", "Koenigsegg", "Marussia"]
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: private methods
    private func loadImagesAndLabels(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            firstImage.image = imagesArray[0]
            secondImage.image = imagesArray[1]
            thirdImage.image = imagesArray[2]
            
            firstLabel.text = labelsArray[0]
            secondLabel.text = labelsArray[1]
            thirdLabel.text = labelsArray[2]
        case 1:
            firstImage.image = imagesArray[3]
            secondImage.image = imagesArray[4]
            thirdImage.image = imagesArray[5]
            
            firstLabel.text = labelsArray[3]
            secondLabel.text = labelsArray[4]
            thirdLabel.text = labelsArray[5]
        default:
            break
        }
        
    }

    //MARK: IBAction
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        loadImagesAndLabels(segmentIndex: sender.selectedSegmentIndex)
    }
    
}
