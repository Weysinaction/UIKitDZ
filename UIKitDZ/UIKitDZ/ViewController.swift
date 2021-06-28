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
        // Do any additional setup after loading the view.
        
        
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
        
        
        
        let songViewController = SongViewController()
        //songViewController.songInfo = SongViewController.SongInfo(songName: songName, songAuthor: songAuthor)
        
        self.present(songViewController, animated: true, completion: nil)
    }
}
