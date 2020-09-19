//
//  ICoordinator.swift
//  UIProgressView
//
//  Created by Алексей Смицкий on 23.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ICoordinator

protocol ICoodinator {
    
    // MARK: - Public properties
    
    var navigationViewController: UINavigationController { get }
    
    // MARK: - Public methods
    
    func start()
}
