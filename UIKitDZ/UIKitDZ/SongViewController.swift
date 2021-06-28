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

    @IBOutlet var songSlider: UISlider!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var songLabelHeader: UILabel!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var songAuthorLabel: UILabel!
    @IBOutlet var startSongLabel: UILabel!
    @IBOutlet var endSongLabel: UILabel!
    @IBOutlet var buttonPlayPause: UIButton!
    var player = AVAudioPlayer()
    var playFlag = false
    var audioPath = ""
    
    var songArray: [(songName: String, songAuthor: String, songFile: String)] = []
    var songID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Записываем значения в лейблы, согласно переданному ID песни и создаем плеер.
        initLabels(songID: songID)
        switch songID {
        case 0:
            imageView.image = UIImage(named: "iu-4")
        case 1:
            imageView.image = UIImage(named: "iu-3")
        default:
            break
        }
        initPlayer()
        setPlayerPlay()

            
        songSlider.value = 0
        songSlider.maximumValue = Float(player.duration)
        songSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        endSongLabel.text = convertSecondToMinutes(duration: Int(player.duration))
        //songSlider.
        
    }
    
    //MARK: -Method for buttons
    //объявляем действие для кнопки закрытия вью
    @IBAction func buttonDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //действие для кнопки Play/Pause
    @IBAction func buttonPlayPauseTapped(_ sender: Any) {
        if playFlag {
            //imageView.image = UIImage(systemName: "person-fill")
            player.stop()
            setPlayerPause()
        } else {
            player.play()
            setPlayerPlay()
        }
        
    }
    @IBAction func nextSongButton(_ sender: Any) {
        if self.songID < songArray.count - 1 {
            self.songID += 1
            imageView.image = UIImage(named: "iu-3")
        }
        initLabels(songID: self.songID)
        initPlayer()
        setPlayerPlay()
        
    }
    @IBAction func previousSongButton(_ sender: Any) {
        if self.songID > 0 {
            self.songID -= 1
            imageView.image = UIImage(named: "iu-4")
        }
        initLabels(songID: self.songID)
        initPlayer()
        setPlayerPlay()
        
    }
    

    @objc func changeSlider(sender: UISlider) {
        if sender == songSlider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    //MARK: -Methods for initialize
    //Объявляем инициализатор для лейблов
    func initLabels(songID: Int) {
        songLabelHeader.text = songArray[songID].songName
        songNameLabel.text = songArray[songID].songName
        songAuthorLabel.text = songArray[songID].songAuthor
    }
    
    //Объявляем инициализатор для плеера
    func initPlayer() {
        audioPath = Bundle.main.path(forResource: songArray[songID].songFile, ofType: "mp3")!
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            
        } catch {
            print("Error")
        }
        self.player.play()
        self.songSlider.maximumValue = Float(player.duration)
        self.songSlider.value = 0
        self.endSongLabel.text = convertSecondToMinutes(duration: Int(player.duration))
    }
    
    //convert seconds to minuted and seconds
    func convertSecondToMinutes(duration: Int) -> String {
        var minutes = 0
        var seconds = 0
        minutes = duration / 60
        seconds = duration % 60
        if seconds < 10 {
            return "\(minutes):0\(seconds)"
        } else {
            return "\(minutes):\(seconds)"
        }
    }
    
    func setPlayerPlay() {
        playFlag = true
        buttonPlayPause.setImage(UIImage(named: "pause"), for: .normal)

    }
    
    func setPlayerPause() {
        playFlag = false
        buttonPlayPause.setImage(UIImage(named: "play"), for: .normal)

    }
    
    
}
