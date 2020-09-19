//
//  SettingsViewController.swift
//  UITabBarVC
//
//  Created by Алексей Смицкий on 31.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - SettingsViewController

final class SettingsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var connectButton = UIButton()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addViews()
        addActions()
        layout()
    }
    // MARK: - Private methods
    
    private func layout() {
        
        connectButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            connectButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            connectButton.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            connectButton.widthAnchor.constraint(
                equalToConstant: Constants.connectButtonWidthAncor),
            connectButton.heightAnchor.constraint(
                equalToConstant: Constants.connectButtonHeightAncor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func connectTarget() {
        
        let alert = UIAlertController(title: "Пожалуйста", message: "Напишите отзыв", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Отправить", style: .default, handler: nil)
        
        alert.addAction(doneButton)
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Setups

private extension SettingsViewController {
    
    func setupView() {
        setConnectButton()
    }
    
    func setConnectButton() {
        connectButton.setTitle(Constants.connectButtonTitle, for: .normal)
        connectButton.backgroundColor = Constants.connectButtonColor
        connectButton.layer.cornerRadius = Constants.connectButtonRadius
    }
}

// MARK: - Setup Elements

private extension SettingsViewController {
    
    func addViews() {
        view.addSubview(connectButton)
    }
    
    func addActions() {
        connectButton.addTarget(self, action: #selector(connectTarget), for: .touchDown)
    }
}

// MARK: - Constants

private extension SettingsViewController {
    
    enum Constants {
        static let connectButtonTitle: String = "Форма обратной связи"
        static let connectButtonColor: UIColor = .lightGray
        static let connectButtonRadius: CGFloat = 25
        static let connectButtonWidthAncor: CGFloat = 200
        static let connectButtonHeightAncor: CGFloat = 200
    }
}
