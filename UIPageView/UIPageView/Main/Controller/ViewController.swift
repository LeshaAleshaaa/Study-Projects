//
//  ViewController.swift
//  UIPageView
//
//  Created by Алексей Смицкий on 24.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var stepLabel = UILabel()
    private lazy var stepImage = UIImageView()
    private lazy var stepText = UILabel()
    
    // MARK: - Initalization
    
    init(whichPhone: PhoneInfo) {
        super.init(nibName: nil, bundle: nil)
        stepLabel.text = whichPhone.phoneName
        stepImage.image = whichPhone.phoneImage
        stepText.text = whichPhone.phoneText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.stepLabelTopAncor),
            stepLabel.heightAnchor.constraint(
                equalToConstant: Constants.stepLabelHeightAncor),
            stepLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        stepImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepImage.topAnchor.constraint(
                equalTo: stepLabel.bottomAnchor,
                constant: Constants.stepImageTopAncor),
            stepImage.widthAnchor.constraint(
                equalToConstant: Constants.stepImageWidthAncor),
            stepImage.heightAnchor.constraint(
                equalToConstant: Constants.stepImageHeightAncor),
            stepImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        stepText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepText.topAnchor.constraint(
                equalTo: stepImage.bottomAnchor,
                constant: Constants.stepTextTopAncor),
            stepText.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            stepText.widthAnchor.constraint(
                equalTo: stepImage.widthAnchor),
            stepText.heightAnchor.constraint(
                equalToConstant: Constants.stepTextHeightAncor)])
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupViews() {
        setStepLabel()
        setStepText()
        setStepImage()
    }
    
    func setStepLabel() {
        stepLabel.font = .boldSystemFont(ofSize: Constants.stepLabelFont)
        stepLabel.contentMode = .center
    }
    
    func setStepText() {
        stepText.font = .boldSystemFont(ofSize: Constants.stepTextFont)
        stepText.contentMode = .center
    }
    
    func setStepImage() {
        stepImage.contentMode = .scaleAspectFit
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(stepLabel)
        view.addSubview(stepImage)
        view.addSubview(stepText)
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let stepLabelTopAncor: CGFloat = 50
        static let stepLabelHeightAncor: CGFloat = 50
        static let stepLabelFont: CGFloat = 25
        
        static let stepImageTopAncor: CGFloat = 20
        static let stepImageWidthAncor: CGFloat = 300
        static let stepImageHeightAncor: CGFloat = 300
        
        static let stepTextTopAncor: CGFloat = 20
        static let stepTextHeightAncor: CGFloat = 100
        static let stepTextFont: CGFloat = 25
    }
}
