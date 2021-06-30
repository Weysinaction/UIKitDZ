//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActivityItemSource {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pickerViewChange()
    }


    @IBAction func buttonShareTapped(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: [label.text ?? "nil"], applicationActivities: nil)
        //vc.excludedActivityTypes = [UIActivity.ActivityType.message]
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            let activityViewController = UIActivityViewController(activityItems: [self.label.text ?? "nil"], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    //Activity items
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        NSLog("Place Holder")
        return label.text ?? ""
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        NSLog("Place holder itemForActivity")
        
        if(activityType == UIActivity.ActivityType.postToFacebook) {
            return label.text ?? ""
        } else {
            return label.text ?? ""
        }
    }
    
    func pickerViewChange() {
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "First"
        case 1:
            return "Second"
        case 2:
            return "Third"
        case 3:
            return "Fourth"
        case 4:
            return "Fifth"
        default:
            return ""
        }
    }
}
