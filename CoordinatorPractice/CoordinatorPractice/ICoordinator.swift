//
//  ICoordinator.swift
//  CoordinatorPractice
//
//  Created by Алексей Смицкий on 03.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

protocol ICoordinator {
    var navigationVC: UINavigationController { get }
    func start()
}
