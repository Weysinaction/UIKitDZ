//
//  DetailsViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 30.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var labelArticle: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var shareButton: UIButton!
    
    //MARK: Public variables
    //Инициализируем 
    var header: String = ""
    var article: String = ""
    var image = UIImage()
    var activityVC: UIActivityViewController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNews()
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
    }
    
    //MARK: Public methods
    func initNews() {
        titleLabel.text = header
        labelArticle.text = article
        imageView.image = image
    }
    
    //MARK: Selectors
    
    @objc func shareTapped(_ sender: Any) {
        print("share")
        self.activityVC = UIActivityViewController(activityItems: [self.header], applicationActivities: nil)
        self.present(activityVC!, animated: true, completion: nil)

    }
}
