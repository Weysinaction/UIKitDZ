//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: private properties
    private let mainTextView = UITextView()
    private let textSizeSlider = UISlider()
    private let minTextSizeLabel = UILabel()
    private let maxTextSizeLabel = UILabel()
    private let brownColorButton = UIButton()
    private let blueColorButton = UIButton()
    private let blackColorButton = UIButton()
    private let orangeColorButton = UIButton()
    private let minTextWidthButton = UIButton()
    private let maxTextWidthButton = UIButton()
    private let shareButton = UIButton()
    private let darkThemeSwitch = UISwitch()
    private let fontStylePickerView = UIPickerView()
    private var activityViewController: UIActivityViewController? = nil
    private let poemString = "Шляпа лежала на комоде, котенок Васька сидел на полу возле комода, а Вовка и Вадик сидели за столом и раскрашивали картинки. \n— Ай-ай-ай! \n— и бегом в сторону. \n— Чего ты? — спрашивает Вадик. \n— Она жи-жи-живая! \n— Кто живая? \n— Шля-шля-шля-па. \n— Что ты! Разве шляпы бывают живые? \n— По-посмотри сам! Вадик подошел поближе и стал смотреть на шляпу. Вдруг шляпа поползла прямо к нему. Он как закричит: \n— Ай! — и прыг на диван. Вовка за ним. \nШляпа вылезла на середину комнаты и остановилась. Ребята смотрят на нее и трясутся от страха. Тут шляпа повернулась и поползла к дивану. — Ай! Ой! — закричали ребята. \nСоскочили с дивана — и бегом из комнаты. Прибежали на кухню и дверь за собой закрыли. \n— Я у-у-хо-хо-жу! — говорит Вовка. \n— Куда? \n— Пойду к себе домой. \n— Почему? \n— Шляпы бо-боюсь! Я первый раз вижу, чтоб шляпа по комнате ходила. \n— А может быть, ее кто-нибудь за веревочку дергает? \n— Ну, пойди, посмотри. \n— Пойдем вместе. Я возьму клюшку. Если она к нам полезет, я ее клюшкой тресну. \n— Постой, я тоже клюшку возьму. \n— Да у нас другой клюшки нет. \n— Ну, я возьму лыжную палку. \nОни взяли клюшку и лыжную палку, приоткрыли дверь и заглянули в комнату.\n— Где же она? — спрашивает Вадик. \n— Вон там, возле стола. \n— Сейчас я ее как тресну клюшкой! — говорит Вадик. — Пусть только подлезет ближе, бродяга такая! \nНо шляпа лежала возле стола и не двигалась. \n— Ага, испугалась! — обрадовались ребята. — Боится лезть к нам. \n— Сейчас я ее спугну, — сказал Вадик. \nОн стал стучать по полу клюшкой и кричать: \n— Эй ты, шляпа! \nНо шляпа не двигалась. \n— Давай наберем картошки и будем в нее картошкой стрелять, — предложил Вовка. \nОни вернулись на кухню, набрали из корзины картошки и стали швырять ее в шляпу» Швыряли, швыряли, наконец, Вадик попал. Шляпа как подскочит кверху! \n— Мяу! — закричало что-то. Глядь, из-под шляпы высунулся серый хвост, потом лапа, а потом и сам котенок выскочил. \n— Васька! — обрадовались ребята. \n— Наверно, он сидел на полу, а шляпа на него с комода упала, — догадался Вовка. \nВадик схватил Ваську и давай его обнимать! \n— Васька, миленький, как же ты под шляпу попал? \nНо Васька ничего не ответил, Он только фыркал и жмурился от света."
    private let fontsArray = ["Arial", "Arial Italic", "Avenir Next Heavy", "Baskerville", "Bodoni Ornaments", "Chalkduster", "Cochin", "Courier New"]
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        setupTextSizeSlider()
        setupLabels()
        setupButtons()
        setupSwitch()
        setupPickerView()
    }

    func setupTextView() {
        mainTextView.frame = CGRect(x: 20, y: 100, width: self.view.bounds.width - 40 , height: self.view.bounds.height / 2)
        mainTextView.text = poemString
        mainTextView.font = UIFont.systemFont(ofSize: CGFloat(textSizeSlider.value))
        self.view.addSubview(mainTextView)
    }
    
    func setupTextSizeSlider() {
        textSizeSlider.frame = CGRect(x: 100, y: 580, width: 220, height: 50)
        self.view.addSubview(textSizeSlider)
        textSizeSlider.tintColor = .systemOrange
        textSizeSlider.minimumValue = 10
        textSizeSlider.maximumValue = 50
        textSizeSlider.value = 17
        textSizeSlider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
    }
    
    func setupLabels() {
        minTextSizeLabel.frame = CGRect(x: 50, y: 580, width: 50, height: 50)
        minTextSizeLabel.textAlignment = .center
        minTextSizeLabel.font = UIFont.systemFont(ofSize: 17)
        minTextSizeLabel.text = "A"
        minTextSizeLabel.textColor = .systemOrange
        self.view.addSubview(minTextSizeLabel)
        
        maxTextSizeLabel.frame = CGRect(x: 320, y: 580, width: 50, height: 50)
        maxTextSizeLabel.textAlignment = .center
        maxTextSizeLabel.font = UIFont.systemFont(ofSize: 28)
        maxTextSizeLabel.text = "A"
        maxTextSizeLabel.textColor = .systemOrange
        self.view.addSubview(maxTextSizeLabel)
    }
    
    func setupButtons() {
        brownColorButton.frame = CGRect(x: 30, y: 650, width: 50, height: 50)
        brownColorButton.backgroundColor = .brown
        brownColorButton.addTarget(self, action: #selector(buttonColorTapped(sender:)), for: .touchUpInside)
        brownColorButton.layer.cornerRadius = brownColorButton.frame.width / 2
        self.view.addSubview(brownColorButton)
        
        blackColorButton.frame = CGRect(x: 130, y: 650, width: 50, height: 50)
        blackColorButton.backgroundColor = .black
        blackColorButton.addTarget(self, action: #selector(buttonColorTapped(sender:)), for: .touchUpInside)
        blackColorButton.layer.cornerRadius = brownColorButton.frame.width / 2
        self.view.addSubview(blackColorButton)
        
        blueColorButton.frame = CGRect(x: 230, y: 650, width: 50, height: 50)
        blueColorButton.backgroundColor = .systemBlue
        blueColorButton.addTarget(self, action: #selector(buttonColorTapped(sender:)), for: .touchUpInside)
        blueColorButton.layer.cornerRadius = brownColorButton.frame.width / 2
        self.view.addSubview(blueColorButton)
        
        orangeColorButton.frame = CGRect(x: 330, y: 650, width: 50, height: 50)
        orangeColorButton.backgroundColor = .orange
        orangeColorButton.addTarget(self, action: #selector(buttonColorTapped(sender:)), for: .touchUpInside)
        orangeColorButton.layer.cornerRadius = brownColorButton.frame.width / 2
        self.view.addSubview(orangeColorButton)
        
        minTextWidthButton.frame = CGRect(x: 120, y: 710, width: 50, height: 50)
        minTextWidthButton.setTitle("a", for: .normal)
        minTextWidthButton.addTarget(self, action: #selector(textWidthButtonTapped(sender:)), for: .touchUpInside)
        minTextWidthButton.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(minTextWidthButton)
        
        maxTextWidthButton.frame = CGRect(x: 250, y: 710, width: 50, height: 50)
        maxTextWidthButton.setTitle("A", for: .normal)
        maxTextWidthButton.addTarget(self, action: #selector(textWidthButtonTapped(sender:)), for: .touchUpInside)
        maxTextWidthButton.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(maxTextWidthButton)
        
        shareButton.frame = CGRect(x: 50, y: 750, width: 50, height: 50)
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(shareTapped(sender:)), for: .touchUpInside)
        shareButton.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(shareButton)
    }
    
    func setupPickerView() {
        fontStylePickerView.frame = CGRect(x: 200, y: 750, width: 200, height: 100)
        fontStylePickerView.dataSource = self
        fontStylePickerView.delegate = self
        self.view.addSubview(fontStylePickerView)
    }
    
    func setupSwitch() {
        darkThemeSwitch.frame = CGRect(x: 50, y: 800, width: 50, height: 50)
        darkThemeSwitch.addTarget(self, action: #selector(darkThemeSwitched(sender:)), for: .valueChanged)
        self.view.addSubview(darkThemeSwitch)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mainTextView.resignFirstResponder()
    }
    
    //MARK: Selectors
    @objc func sliderChanged(sender: UISlider) {
        mainTextView.font = UIFont.systemFont(ofSize: CGFloat(textSizeSlider.value))
    }
    
    @objc func buttonColorTapped(sender: UIButton) {
        switch sender {
        case brownColorButton:
            mainTextView.textColor = .brown
        case blackColorButton:
            mainTextView.textColor = .black
        case blueColorButton:
            mainTextView.textColor = .blue
        case orangeColorButton:
            mainTextView.textColor = .orange
        default:
            break
        }
    }
    
    @objc func shareTapped(sender: UIButton) {
        activityViewController = UIActivityViewController(activityItems: [mainTextView.text ?? "Не удалось получить занчение"], applicationActivities: nil)
        self.present(activityViewController ?? self, animated: true, completion: nil)
    }
    
    @objc func textWidthButtonTapped(sender: UIButton) {
        switch sender {
        case minTextWidthButton:
            print("min")
            mainTextView.font = UIFont.systemFont(ofSize: CGFloat(textSizeSlider.value))
        case maxTextWidthButton:
            print("max")
            mainTextView.font = UIFont.boldSystemFont(ofSize: CGFloat(textSizeSlider.value))
        default:
            break
        }
    }
    
    @objc func darkThemeSwitched(sender: UISwitch) {
        if darkThemeSwitch.isOn {
            self.view.backgroundColor = .darkGray
            mainTextView.backgroundColor = .darkGray
        } else {
            self.view.backgroundColor = .systemBackground
            mainTextView.backgroundColor = .systemBackground
        }
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        8
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 1:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 2:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 3:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 4:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 5:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 6:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        case 7:
            mainTextView.font = UIFont(name: fontsArray[row], size: CGFloat(textSizeSlider.value))
        default:
            break
        }
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Arial"
        case 1:
            return "Arial Italic"
        case 2:
            return "Avenir Next Heavy"
        case 3:
            return "Baskerville"
        case 4:
            return "Bodoni Ornaments"
        case 5:
            return "Chalkduster"
        case 6:
            return "Cochin"
        case 7:
            return "Courier New"
        default:
            return ""
        }
    }
}
