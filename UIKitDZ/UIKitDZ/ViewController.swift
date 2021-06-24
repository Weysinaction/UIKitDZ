//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cafe Mario"
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonAddPaymentAction(_ sender: Any) {
        
        //performSegue(withIdentifier: "SegueFromFirstToCheck", sender: self)
        initAlertController(title: "Выставить чек?", message: nil, prefferedStyle: .alert)
    }
    
    func initAlertController(title: String, message: String?, prefferedStyle: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        let actionYes = UIAlertAction(title: "Yes", style: .default) { [weak self](actionYes) in
            self?.performSegue(withIdentifier: "SegueFromFirstToCheck", sender: self)
        }
        let actionNo = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(actionYes)
        alertController.addAction(actionNo)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

