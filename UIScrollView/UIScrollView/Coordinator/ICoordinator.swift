//
//  ICoordinator.swift
//  UIScrollView
//
//  Created by Алексей Смицкий on 12.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ICoordinator

protocol ICoordinator {
    
    // MARK: - Public properties
    
    var navigationViewController: UINavigationController { get }
    
    // MARK: - Public methods
    
    func start()
}
