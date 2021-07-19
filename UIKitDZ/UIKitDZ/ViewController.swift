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
    private let viewRed: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private let viewYellow: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let viewGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private let viewBlack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    //MARK: View Controller's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewBlack)
        view.addSubview(viewRed)
        view.addSubview(viewYellow)
        view.addSubview(viewGreen)
        
        createRedViewConstraint()
        createYellowViewConstraint()
        createGreenViewConstraint()
        createBlackViewConstraint()
        
    }

    //private methods
    private func createRedViewConstraint() {
        viewRed.leftAnchor.constraint(equalTo: viewBlack.leftAnchor, constant: 10).isActive = true
        viewRed.rightAnchor.constraint(equalTo: viewBlack.rightAnchor, constant: -10).isActive = true
        viewRed.topAnchor.constraint(equalTo: viewBlack.topAnchor, constant: 10).isActive = true
        viewRed.heightAnchor.constraint(equalTo: viewYellow.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func createYellowViewConstraint() {
        viewYellow.leftAnchor.constraint(equalTo: viewBlack.leftAnchor, constant: 10).isActive = true
        viewYellow.rightAnchor.constraint(equalTo: viewBlack.rightAnchor, constant: -10).isActive = true
        viewYellow.topAnchor.constraint(equalTo: viewRed.bottomAnchor, constant: 8).isActive = true
        viewYellow.heightAnchor.constraint(equalTo: viewGreen.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func createGreenViewConstraint() {
        viewGreen.leftAnchor.constraint(equalTo: viewBlack.leftAnchor, constant: 10).isActive = true
        viewGreen.rightAnchor.constraint(equalTo: viewBlack.rightAnchor, constant: -10).isActive = true
        viewGreen.topAnchor.constraint(equalTo: viewYellow.bottomAnchor, constant: 8).isActive = true
        viewGreen.bottomAnchor.constraint(equalTo: viewBlack.bottomAnchor, constant: -10).isActive = true

    }
    
    private func createBlackViewConstraint() {
        viewBlack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewBlack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewBlack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        viewBlack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
}

