//
//  SongViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 25.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var songLabelHeader: UILabel!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var songAuthorLabel: UILabel!
    @IBOutlet var startSongLabel: UILabel!
    @IBOutlet var endSongLabel: UILabel!
    @IBOutlet var buttonPlayPause: UIButton!
    var songInfo: SongInfo!
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        do {
//            if let audioPath = Bundle.main.path(forResource: "nirvana", ofType: "mp3") {
//                player = try AVPlayer(url: URL(fileURLWithPath: audioPath))
//                print("audioPath = \(audioPath)")
//            }
//        } catch {
//            print("Error", error.localizedDescription)
//        }
        
        do {
            if let audioPath = Bundle.main.path(forResource: "nirvana", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
        
        self.player.play()
        //endSongLabel.text = String(self.player.duration)
        
    }
    
    struct SongInfo {
        var songName: String
        var songAuthor: String
    }

    @IBAction func buttonDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonPlayPauseTapped(_ sender: Any) {
//        if player.play() {
//            imageView.image = UIImage(systemName: "person-fill")
//            player.stop()
//        } else {
//            player.play()
//        }
        print("buttonPlayPressed")
    }
}
