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
    var songsArray: [(songName: String, songAuthor: String, songFile: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsArray = [(songName: "Camry 3.5", songAuthor: "UncleFlexxx", songFile: "camry_3_5"),
                      (songName: "Smells like teen spirit", songAuthor: "Nirvana", songFile: "nirvana")]
        
        
    }
    
    
   
    @IBAction func firstSongTapped(_ sender: Any) {
        presentSongView(songArray: songsArray, songID: 0)
    }
    @IBAction func secondSongTapped(_ sender: Any) {
        presentSongView(songArray: songsArray, songID: 1)
    }
    
    func presentSongView(songArray: [(songName: String, songAuthor: String, songFile: String)], songID: Int) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "SongViewController") as! SongViewController
        controller.songArray = songsArray
        controller.songID = songID
        self.present(controller, animated: true, completion: nil)
    }
    
}
