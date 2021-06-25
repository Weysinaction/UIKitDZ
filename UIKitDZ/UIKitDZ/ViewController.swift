//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var sliderVolume: UISlider!
    var player = AVAudioPlayer()
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        
        self.view.addSubview(slider)
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "gribi", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch  {
            print("Error")
        }
        self.player.play()
    }
    
    //MARK: Methods
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
        
    }

    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        self.player.volume = self.sliderVolume.value
    }
}


