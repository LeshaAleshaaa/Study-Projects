//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by Алексей Смицкий on 03.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

class Coordinator: ICoordinator {
    var navigationVC: UINavigationController
    
    init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func start() {
        goToViewController()
    }
    
    func goToViewController() {
        let viewController = ViewController()
        viewController.coordinator = self
        navigationVC.pushViewController(viewController, animated: true)
    }
    
    func goToSecondViewController() {
        let secondViewController = SecondViewController()
        navigationVC.pushViewController(secondViewController, animated: true)
    }
}
