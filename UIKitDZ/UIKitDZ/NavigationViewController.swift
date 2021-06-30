//
//  NavigationViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 30.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit
var newsArray: [(title: String, news: String, image: UIImage?)] = []

class NavigationViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var labelFour: UILabel!
    
    //MARK: Public properties
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createArrayOfNews()
        initTapGestures()
    }
    
    //MARK: Public Methods
    
    //init array of articles
    func createArrayOfNews() {
        newsArray = [(title: "Британцы призвали Нидерланды не дразнить русского медведя", news: "МОСКВА, 30 июн — РИА Новости. Читатели британского издания Express прокомментировали сопровождение российскими истребителями голландского фрегата Evertsen в Черном море. Некоторые из них напомнили Нидерландам о произошедшем недавно инциденте с эсминцем Defender у мыса Фиолент.\"В следующий раз русские предупредят, что потопят корабль\", — выразил мнение пользователь с ником MakeBritainGreat. \"Россия вызывает панику, серьезно? А что этот голландский корабль делал прямо у ее берегов?\" — задался вопросом nomayor. \"Defender был первым из тех, кто решил подразнить русского медведя. Но когда командир понял, что, если он продолжит настаивать, защищаться будет сложно, он поспешно покинул российские воды. Голландцы наверняка хотели попробовать сделать то же самое, однако когда медведь только начал рычать, они развернулись, прежде чем пересечь границу\".", UIImage(named: "image1")),
                     (title: "Мясников назвал продукт, провоцирующий рак", news: "МОСКВА, 30 июн — РИА Новости. Врач и телеведущий Александр Мясников рассказал в эфире телеканала \"Россия 1\" об опасности красного мяса. По словам медика, употребление в пищу таких блюд, как шашлык и жаркое, может привести к серьезным проблемам со здоровьем. Ведущий подчеркнул, что красное мясо можно есть, но только в ограниченном количестве, не более двух-трех раз в неделю. Врач также оценил вегетарианские колбасы и сосиски. По его мнению, такая еда \"отвратительна на вкус\" и, скорее всего, бесполезна. Если человек считает себя истинным вегетарианцем, он не станет питаться продуктами, внешне схожими с мясными, подытожил специалист.",  UIImage(named: "image3")),
                     (title: "Опрос показал отношение россиян к повторной вакцинации от коронавируса", news: "МОСКВА, 30 июн — РИА Новости. Большинство привившихся от COVID-19 россиян согласны последовать рекомендации Минздрава и повторно пройти вакцинацию. Об этом сообщил РБК со ссылкой на исследование сервиса Superjob. В опросе приняли участие 1,6 тысячи совершеннолетних жителей России. Согласно его результатам, более чем три четверти респондентов (78%) готовы к ревакцинации, при этом 43% заявили, что сделают это в любом случае. Не одобрили идею прививаться заново 22% опрошенных, а шесть процентов высказались категорически против. Вакцинация от коронавируса проходит во всех российских регионах. Еще в августе 2020 года Минздрав зарегистрировал первый в мире препарат для профилактики COVID-19, разработанный в Национальном центре имени академика Гамалеи, — \"Спутник V\".", UIImage(named: "image2")),
                     (title: "В Израиле показали видео с \"уничтожением\" российского корабля", news: "МОСКВА, 30 июн — РИА Новости. Один из крупнейших израильских производителей в сфере военно-промышленного комплекса, компания Rafael, продемонстрировала новую крылатую ракету Sea Breaker, показав в анимационном видеоролике уничтожение ракетного катера советского производства. Как сообщается на сайте Rafael, новая управляемая ракета как наземного, так и морского базирования может уничтожать цели на расстоянии до 300 километров в условиях сильного радиоэлектронного противодействия. По данным производителя, одной ракеты достаточно для уничтожения цели класса \"фрегат\". В анимационном ролике на сайте Rafael показано уничтожение ракетного катера с бортовым номером 962. Согласно открытым данным, такой катер Р-71 \"Шуя\" (проект 1241) был спущен на воду в 1983 году и входит в состав Черноморского флота ВМФ России.", UIImage(named: "image4"))]
    }
    
    //create gestures and add to lables
    func initTapGestures() {
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_ :)))
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_ :)))
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_ :)))
        let tapFour = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_ :)))
        
        labelOne.addGestureRecognizer(tapOne)
        labelOne.isUserInteractionEnabled = true
        labelOne.tag = 0
        
        labelTwo.addGestureRecognizer(tapTwo)
        labelTwo.isUserInteractionEnabled = true
        labelTwo.tag = 1
        
        labelThree.addGestureRecognizer(tapThree)
        labelThree.isUserInteractionEnabled = true
        labelThree.tag = 2
        
        labelFour.addGestureRecognizer(tapFour)
        labelFour.isUserInteractionEnabled = true
        labelFour.tag = 3
    }
    
    //MARK: selectors
    @objc func labelTapped(_ handler: UITapGestureRecognizer? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.header = newsArray[handler?.view?.tag ?? 0].title
        viewController.article = newsArray[handler?.view?.tag ?? 0].news
        viewController.image = newsArray[handler?.view?.tag ?? 0].image ?? UIImage()

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
