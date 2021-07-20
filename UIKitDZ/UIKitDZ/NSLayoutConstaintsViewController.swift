//
//  NSLayoutConstaintsViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 20.07.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import UIKit

final class NSLayoutConstaintsViewController: UIViewController {
    
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
    
    //MARK: ViewController's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
    }
    
    //MARK: private methods
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        self.title = "NSLayoutConstraints"
        
        addSubViews()
        createConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(viewBlack)
        view.addSubview(viewRed)
        view.addSubview(viewYellow)
        view.addSubview(viewGreen)
    }
    
    private func createConstraints() {
        createRedViewConstraint()
        createYellowViewConstraint()
        createGreenViewConstraint()
        createBlackViewConstraint()
    }
    
    private func createRedViewConstraint() {
        NSLayoutConstraint(item: viewRed,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: viewRed,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: viewRed,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: viewRed,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewYellow,
                           attribute: .top,
                           multiplier: 1,
                           constant: -10).isActive = true
    }
    
    private func createYellowViewConstraint() {
        NSLayoutConstraint(item: viewYellow,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: viewYellow,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: viewYellow,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewGreen,
                           attribute: .top,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: viewYellow,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: viewRed,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createGreenViewConstraint() {
        NSLayoutConstraint(item: viewGreen,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: viewGreen,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: viewGreen,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: viewYellow,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: viewGreen,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -10).isActive = true
    }
    
    private func createBlackViewConstraint() {
        NSLayoutConstraint(item: viewBlack,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 220).isActive = true
        
        NSLayoutConstraint(item: viewBlack,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: viewBlack,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: viewBlack,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
}
