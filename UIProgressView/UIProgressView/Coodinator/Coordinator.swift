//
//  Coordinator.swift
//  UIProgressView
//
//  Created by Алексей Смицкий on 23.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Coodinator

final class Coordinator: ICoodinator {
    
    // MARK: - Public properties
    
    var navigationViewController: UINavigationController
    
    // MARK: - Initialization
    
    init(naviViewController: UINavigationController) {
        self.navigationViewController = naviViewController
    }
    
    // MARK: - Public methods
    
    func start() {
        goToFirstViewController()
    }
    
    func goToFirstViewController() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationViewController.pushViewController(firstViewController, animated: true)
    }
    
    func goToSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        navigationViewController.pushViewController(secondViewController, animated: true)
    }
}
