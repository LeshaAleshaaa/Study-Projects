//
//  Coordinator.swift
//  UIImageView
//
//  Created by Алексей Смицкий on 11.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Coordinator

final class Coordinator: ICoordinator {
    
    // MARK: - Public properties
    
    var navigationViewController: UINavigationController
    
    // MARK: - Initalization
    
    init(navigationVC: UINavigationController) {
        self.navigationViewController = navigationVC
    }
    
    // MARK: - Public methods
    
    func start() {
        goToViewController()
    }
    
    func goToViewController() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationViewController.pushViewController(firstViewController, animated: true)
    }
    
    func goToSecondViewController() {
        let secondViewController = SecondViewController()
        navigationViewController.pushViewController(secondViewController, animated: true)
    }
}
