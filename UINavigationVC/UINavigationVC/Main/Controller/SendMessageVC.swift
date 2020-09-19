//
//  SendMessageVC.swift
//  UINavigationVC
//
//  Created by Алексей Смицкий on 29.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit
// MARK: - SendMessageVC

final class SendMessageVC: UIViewController {
    
    // MARK: - Private properties
    
    private let selectedImage = UIImageView()
    private let saveImage = UIButton()
    private let sendImage = UIButton()
    
    // MARK: - Public methods
    
    func pushImage(which: UIImage) {
        selectedImage.image = which
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectedImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.selectedImageTopAncor),
            selectedImage.widthAnchor.constraint(
                equalToConstant: Constants.selectedImageWidthAncor),
            selectedImage.heightAnchor.constraint(
                equalToConstant: Constants.selectedImageHeightAncor),
            selectedImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        
        saveImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveImage.topAnchor.constraint(
                equalTo: selectedImage.bottomAnchor,
                constant: Constants.saveImageTopAncor),
            saveImage.widthAnchor.constraint(
                equalToConstant: Constants.saveImageWidthAncor),
            saveImage.heightAnchor.constraint(
                equalToConstant: Constants.saveImageHeightAncor),
            saveImage.leadingAnchor.constraint(
                equalTo: selectedImage.leadingAnchor,
                constant: Constants.saveImageLeadingAncor)])
        
        sendImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sendImage.topAnchor.constraint(
                equalTo: selectedImage.bottomAnchor,
                constant: Constants.sendImageTopAncor),
            sendImage.widthAnchor.constraint(
                equalToConstant: Constants.sendImageWidthAncor),
            sendImage.heightAnchor.constraint(
                equalToConstant: Constants.sendImageHeightAncor),
            sendImage.trailingAnchor.constraint(
                equalTo: selectedImage.trailingAnchor,
                constant: Constants.sendImageTrailingAncor)])
        
    }
    
    // MARK: - Selectors
    
    @objc
    private func saveImageSelector() {
        
        if let image = selectedImage.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            present(activityVC, animated: true, completion: nil)
        }
    }
    
    @objc
    private func sendImageSelector() {
        
        let alert = UIAlertController(title: "Внимание!", message: "Введите e-mail", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Готово", style: .cancel, handler: nil)
        
        alert.addAction(doneButton)
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addViews()
        addActions()
        layout()
    }
}
// MARK: - Setups

private extension SendMessageVC {
    
    func setupView() {
        title = "Save or Send"
        navigationController?.navigationBar.backgroundColor = .black
        setSaveImage()
        setSendImage()
    }
    
    func setSaveImage() {
        saveImage.setImage(Constants.saveImageIcon, for: .normal)
    }
    
    func setSendImage() {
        sendImage.setImage(Constants.sendImageIcon, for: .normal)
    }
}

// MARK: - Setup Elements

private extension SendMessageVC {
    
    func addViews() {
        view.addSubview(selectedImage)
        view.addSubview(saveImage)
        view.addSubview(sendImage)
    }
    
    func addActions() {
        saveImage.addTarget(self, action: #selector(saveImageSelector), for: .touchDown)
        sendImage.addTarget(self, action: #selector(sendImageSelector), for: .touchDown)
    }
    
}

// MARK: - Constants

private extension SendMessageVC {
    
    enum Constants {
        
        static let selectedImageTopAncor: CGFloat = 100
        static let selectedImageWidthAncor: CGFloat = 400
        static let selectedImageHeightAncor: CGFloat = 400
        
        static let saveImageTopAncor: CGFloat = 20
        static let saveImageWidthAncor: CGFloat = 50
        static let saveImageHeightAncor: CGFloat = 50
        static let saveImageLeadingAncor: CGFloat = 50
        static let saveImageIcon = UIImage(named: "save")
        
        static let sendImageTopAncor: CGFloat = 20
        static let sendImageWidthAncor: CGFloat = 50
        static let sendImageHeightAncor: CGFloat = 50
        static let sendImageTrailingAncor: CGFloat = -50
        static let sendImageIcon = UIImage(named: "plane")
    }
}
