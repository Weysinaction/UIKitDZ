//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet private var number: UILabel!
    @IBOutlet private var buttonStartPause: UIButton!
    @IBOutlet private var buttonStop: UIButton!
    
    //MARK: private properties
    private var time = 0
    private var timer = Timer()
    private var seconds = 0
    private var minutes = 0
    private var hours = 0
    private var isTimerStarted = false
    private var secondsString = ""
    private var minutesString = ""
    private var hoursString = ""
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    //MARK: private methods
    private func setupButtons() {
        buttonStartPause.layer.cornerRadius = buttonStartPause.frame.width / 2
        buttonStop.layer.cornerRadius = buttonStop.frame.width / 2
    }
    
    //Форматируем секунды в чч:мм:сс и вводим в лейбл
    private func printResults(time: Int) {
        seconds = time % 60
        minutes = (time / 60) % 60
        hours = time / 3600
        if seconds < 10 {
            secondsString = "0\(seconds)"
        } else {
            secondsString = String(seconds)
        }
        if minutes < 10 {
            minutesString = "0\(minutes)"
        } else {
            minutesString = String(minutes)
        }
        if hours < 10 {
            hoursString = "0\(hours)"
        } else {
            hoursString = String(hours)
        }
        number.text = hoursString + ":" + minutesString + ":" + secondsString
    }
    
    //MARK: IBAction
    @IBAction private func buttonStartPauseAction(_ sender: Any) {
        switch isTimerStarted {
        case true:
            timer.invalidate()
            isTimerStarted = false
            buttonStartPause.setTitle("Старт", for: .normal)
        case false:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
            isTimerStarted = true
            buttonStartPause.setTitle("Пауза", for: .normal)
        }
    }
    
    @IBAction private func buttonStopAction(_ sender: Any) {
        timer.invalidate()
        time = 0
        number.text = "00:00:00"
        isTimerStarted = false
    }
    
    //MARK: selectors
    @objc private func action() {
        time += 1
        printResults(time: time)
    }
}

