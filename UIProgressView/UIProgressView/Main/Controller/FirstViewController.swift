//
//  ViewController.swift
//  UIProgressView
//
//  Created by Алексей Смицкий on 23.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - FirstViewController

final class FirstViewController: UIViewController {
    
    // MARK: - Public properties
    
    var coordinator: Coordinator?
    lazy var selectedImage = UIImageView()
    
    // MARK: - Private properties
    
    private lazy var progressView = UIProgressView()
    private lazy var timer = Timer()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addViews()
        layout()
    }
        
    // MARK: - Private methods
    
    private func layout() {
        
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectedImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            selectedImage.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            selectedImage.widthAnchor.constraint(
                equalToConstant: Constants.selectedImageWidthAncor),
            selectedImage.heightAnchor.constraint(
                equalToConstant: Constants.selectedImageHeightAncor)])
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(
                equalTo: selectedImage.bottomAnchor,
                constant: Constants.progressViewTopAncor),
            progressView.widthAnchor.constraint(
                equalTo: selectedImage.widthAnchor),
            progressView.centerXAnchor.constraint(
                equalTo: selectedImage.centerXAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func secondView() {
        if progressView.progress != Constants.progressViewFull {
            progressView.progress += Constants.progressViewDuration / Constants.progressViewFull
            selectedImage.alpha = CGFloat(progressView.progress)
        } else if progressView.progress == Constants.progressViewFull {
            coordinator?.goToSecondViewController()
            timer.invalidate()
        }
    }
}

// MARK: - Setups

private extension FirstViewController {
    
    func setupViews() {
        setImageView()
        setTimer()
    }
    
    func setImageView() {
        if let image = Constants.userDefaultsSet {
            if let select = UIImage(data: (image as! Data)) {
                selectedImage.image = select
            } else {
                selectedImage.image = Constants.selectedImageImage
            }
        }
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: Constants.timerInterval,
            target: self,
            selector: #selector(secondView),
            userInfo: nil,
            repeats: true)
    }
}

// MARK: - Setup Elements

private extension FirstViewController {
    
    func addViews() {
        view.addSubview(selectedImage)
        view.addSubview(progressView)
    }
}

// MARK: - Constants

private extension FirstViewController {
    
    enum Constants {
        
        static let selectedImageWidthAncor: CGFloat = 300
        static let selectedImageHeightAncor: CGFloat = 300
        static let selectedImageImage = UIImage(named: "beer5")
        
        static let userDefaultsSet = UserDefaults.standard.object(forKey: "image")
        
        static let progressViewTopAncor: CGFloat = 20
        static let progressViewFull: Float = 1
        static let progressViewDuration: Float = 0.01
        
        static let timerInterval: Double = 0.05
    }
}
