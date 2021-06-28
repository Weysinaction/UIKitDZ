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
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            do {
                if let audioPath = Bundle.main.path(forResource: "nirvana", ofType: "mp3") {
                    try self.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                }
            } catch {
                print("Error")
            }
            
            self.player.play()
        }
        
        
    }
    
    
   
    @IBAction func firstSongTapped(_ sender: Any) {
        presentSongView(songName: "Camry 3.5", songAuthor: "UncleFlexxx")
    }
    @IBAction func secondSongTapped(_ sender: Any) {
        presentSongView(songName: "Camry 3.5", songAuthor: "UncleFlexxx")
    }
    
    func presentSongView(songName: String, songAuthor: String) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "SongViewController") as! SongViewController
        self.present(controller, animated: true, completion: nil)
    
    }
}
