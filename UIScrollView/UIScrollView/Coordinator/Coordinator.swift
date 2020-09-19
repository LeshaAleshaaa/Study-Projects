//
//  Coordinator.swift
//  UIScrollView
//
//  Created by Алексей Смицкий on 12.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Coodinator

final class Coordinator: ICoordinator {
    
    // MARK: - Public properties
    
    var navigationViewController: UINavigationController
    
    // MARK: - Initialization
    
    init(naviViewController: UINavigationController) {
        self.navigationViewController = naviViewController
    }
    
    // MARK: - Public methods
    
    func start() {
        gotoViewController()
    }
    
    func gotoViewController() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationViewController.pushViewController(firstViewController, animated: true)
    }
}
