//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: private properties
    private let stackView = UIStackView()
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
        
        setupViewController()
    }

    //private methods
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        self.title = "StackView"
        
        setupNavBar()
        addSubViews()
        setupStackView()
    }
    
    private func addSubViews() {
        view.addSubview(stackView)
        view.addSubview(viewRed)
        view.addSubview(viewYellow)
        view.addSubview(viewGreen)
    }
    
    private func setupNavBar() {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(forwardButtonTapped))
        barButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.addArrangedSubview(viewRed)
        stackView.addArrangedSubview(viewYellow)
        stackView.addArrangedSubview(viewGreen)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    @objc private func forwardButtonTapped() {
        let vc = AnchorsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
     
}

