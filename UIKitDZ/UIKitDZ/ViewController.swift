//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        self.hiLabel.text = "Hi, "
        self.alert(title: "Внимание", message: "Введите ваше имя", style: .alert)
    }
    
    //Second var
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .cancel) { (action) in
            let text = alertController.textFields?.first
            self.hiLabel.text! += (text?.text)! + ("!")
        }
        
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

