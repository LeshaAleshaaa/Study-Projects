//
//  ViewController.swift
//  CoordinatorPractice
//
//  Created by Алексей Смицкий on 03.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var coordinator: Coordinator?
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.center = view.center
        button.backgroundColor = .black
        view.backgroundColor = .green
        button.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
    }

    @objc
    func goToSecondVC() {
        coordinator?.goToSecondViewController()
    }
}
