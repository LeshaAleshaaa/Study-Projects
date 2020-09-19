//
//  SecondViewController.swift
//  UIProgressView
//
//  Created by Алексей Смицкий on 23.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - SecondViewController

final class SecondViewController: UIViewController {
    
    // MARK: - Public properties
    
    var coordinator: Coordinator?
    
    // MARK: - Private properties
    
    private lazy var firstImage = UIImageView()
    private lazy var secondImage = UIImageView()
    private lazy var thirdImage = UIImageView()
    private lazy var fourthImage = UIImageView()
    private lazy var userDefaults = UserDefaults.standard
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.firstImageTopAncor),
            firstImage.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.firstImageLeadingAncor),
            firstImage.widthAnchor.constraint(
                equalToConstant: Constants.firstImageWidthAncor),
            firstImage.heightAnchor.constraint(
                equalToConstant: Constants.firstImageHeightAncor)])
        
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.secondImageTopAncor),
            secondImage.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.secondImageTrailingAncor),
            secondImage.widthAnchor.constraint(
                equalToConstant: Constants.secondImageWidthAncor),
            secondImage.heightAnchor.constraint(
                equalToConstant: Constants.secondImageHeightAncor)])
        
        thirdImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdImage.topAnchor.constraint(
                equalTo: firstImage.bottomAnchor,
                constant: Constants.thirdImageTopAncor),
            thirdImage.leadingAnchor.constraint(
                equalTo: firstImage.leadingAnchor),
            thirdImage.widthAnchor.constraint(
                equalToConstant: Constants.thirdImageWidthAncor),
            thirdImage.heightAnchor.constraint(
                equalToConstant: Constants.thirdImageHeightAncor)])
        
        fourthImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fourthImage.topAnchor.constraint(
                equalTo: secondImage.bottomAnchor,
                constant: Constants.fourthImageTopAncor),
            fourthImage.leadingAnchor.constraint(
                equalTo: secondImage.leadingAnchor),
            fourthImage.widthAnchor.constraint(
                equalToConstant: Constants.fourthImageWidthAncor),
            fourthImage.heightAnchor.constraint(
                equalToConstant: Constants.fourthImageHeightAncor)])
        
    }
    
    private func tap() -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(image(_:)))
        return tap
    }
    
    // MARK: - Selectors
    
    @objc
    private func image(_ sender: UITapGestureRecognizer) {
        guard let saveImage = sender.view as? UIImageView else { return }
        if let savedImage = saveImage.image?.pngData() as NSData? {
            let image : NSData = savedImage
            userDefaults.setValue(image, forKey: "image")
            alertController(title: "Ваше изображение сохранено", message: "Перезапустите приложение для сохранения изменений")
        }
    }
}

// MARK: - Setups

private extension SecondViewController {
    
    func setupViews() {
        setFirstImage()
        setSecondImage()
        setThirdImage()
        setFourthImage()
    }
    
    func setFirstImage() {
        firstImage.image = Constants.firstImageImage
        firstImage.contentMode = .scaleAspectFit
        firstImage.addGestureRecognizer(tap())
        firstImage.isUserInteractionEnabled = true
    }
    
    func setSecondImage() {
        secondImage.image = Constants.secondImageImage
        secondImage.contentMode = .scaleAspectFit
        secondImage.addGestureRecognizer(tap())
        secondImage.isUserInteractionEnabled = true
    }
    
    func setThirdImage() {
        thirdImage.image = Constants.thirdImageImage
        thirdImage.contentMode = .scaleAspectFit
        thirdImage.addGestureRecognizer(tap())
        thirdImage.isUserInteractionEnabled = true
    }
    
    func setFourthImage() {
        fourthImage.image = Constants.fourthImageImage
        fourthImage.contentMode = .scaleAspectFit
        fourthImage.addGestureRecognizer(tap())
        fourthImage.isUserInteractionEnabled = true
    }
}


// MARK: - Setup Elements

private extension SecondViewController {
    
    func addViews() {
        view.addSubview(firstImage)
        view.addSubview(secondImage)
        view.addSubview(thirdImage)
        view.addSubview(fourthImage)
    }
}

// MARK: - Constants

private extension SecondViewController {
    
    enum Constants {
        
        static let firstImageTopAncor: CGFloat = 100
        static let firstImageLeadingAncor: CGFloat = 20
        static let firstImageWidthAncor: CGFloat = 200
        static let firstImageHeightAncor: CGFloat = 200
        static let firstImageImage = UIImage(named: "pizza1")
        
        static let secondImageTopAncor: CGFloat = 100
        static let secondImageTrailingAncor: CGFloat = -20
        static let secondImageWidthAncor: CGFloat = 200
        static let secondImageHeightAncor: CGFloat = 200
        static let secondImageImage = UIImage(named: "pizza2")
        
        static let thirdImageTopAncor: CGFloat = 100
        static let thirdImageLeadingAncor: CGFloat = 20
        static let thirdImageWidthAncor: CGFloat = 200
        static let thirdImageHeightAncor: CGFloat = 200
        static let thirdImageImage = UIImage(named: "burger6")
        
        static let fourthImageTopAncor: CGFloat = 100
        static let fourthImageTrailingAncor: CGFloat = -20
        static let fourthImageWidthAncor: CGFloat = 200
        static let fourthImageHeightAncor: CGFloat = 200
        static let fourthImageImage = UIImage(named: "beer5")
    }
}
