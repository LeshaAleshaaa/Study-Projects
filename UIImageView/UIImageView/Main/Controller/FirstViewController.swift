//
//  FirstViewController.swift
//  UIImageView
//
//  Created by Алексей Смицкий on 11.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - FirstViewController

final class FirstViewController: UIViewController {
    
    // MARK: - Public properties
    
    var coordinator: Coordinator?
    
    // MARK: - Private properties
    
    private lazy var firstImage = UIImageView()
    private lazy var secondImage = UIImageView()
    private lazy var thirdImage = UIImageView()
    private lazy var fourthImage = UIImageView()
    private lazy var fithImage = UIImageView()
    private lazy var sixthImage = UIImageView()
    private lazy var gesture = UITapGestureRecognizer()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
        
        fithImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fithImage.topAnchor.constraint(
                equalTo: thirdImage.bottomAnchor,
                constant: Constants.fifthImageTopAncor),
            fithImage.leadingAnchor.constraint(
                equalTo: thirdImage.leadingAnchor),
            fithImage.widthAnchor.constraint(
                equalToConstant: Constants.fifthImageWidthAncor),
            fithImage.heightAnchor.constraint(
                equalToConstant: Constants.fifthImageHeightAncor)])
        
        sixthImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sixthImage.topAnchor.constraint(
                equalTo: fourthImage.bottomAnchor,
                constant: Constants.sixthImageTopAncor),
            sixthImage.leadingAnchor.constraint(
                equalTo: fourthImage.leadingAnchor),
            sixthImage.widthAnchor.constraint(
                equalToConstant: Constants.sixthImageWidthAncor),
            sixthImage.heightAnchor.constraint(
                equalToConstant: Constants.sixthImageHeightAncor)])
    }
    
    private func tap() -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(image(_:)))
        return tap
    }
    
    // MARK: - Selectors
    
    @objc
    private func image(_ sender: UITapGestureRecognizer) {
        
    }
}

// MARK: - Setup

private extension FirstViewController {
    
    func setupView() {
        setNaviBar()
        setFirstImage()
        setSecondImage()
        setThirdImage()
        setFourthImage()
        setFithImage()
        setSixthImage()
    }
    
    func setNaviBar() {
        title = Constants.titleText
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
    
    func setFithImage() {
        fithImage.image = Constants.fifthImageImage
        fithImage.contentMode = .scaleAspectFit
        fithImage.addGestureRecognizer(tap())
        fithImage.isUserInteractionEnabled = true
    }
    
    func setSixthImage() {
        sixthImage.image = Constants.sixthImageImage
        sixthImage.contentMode = .scaleAspectFit
        sixthImage.addGestureRecognizer(tap())
        sixthImage.isUserInteractionEnabled = true
    }
}

// MARK: - Setup Elements

private extension FirstViewController {
    
    func addViews() {
        view.addSubview(firstImage)
        view.addSubview(secondImage)
        view.addSubview(thirdImage)
        view.addSubview(fourthImage)
        view.addSubview(fithImage)
        view.addSubview(sixthImage)
    }
}

// MARK: - Constants

private extension FirstViewController {
    
    enum Constants {
        
        static let titleText: String = "Выберите картинку"
        
        static let firstImageTopAncor: CGFloat = 100
        static let firstImageLeadingAncor: CGFloat = 50
        static let firstImageWidthAncor: CGFloat = 100
        static let firstImageHeightAncor: CGFloat = 100
        static let firstImageImage = UIImage(named: "pizza1")
        
        static let secondImageTopAncor: CGFloat = 100
        static let secondImageTrailingAncor: CGFloat = -50
        static let secondImageWidthAncor: CGFloat = 100
        static let secondImageHeightAncor: CGFloat = 100
        static let secondImageImage = UIImage(named: "pizza2")
        
        static let thirdImageTopAncor: CGFloat = 100
        static let thirdImageWidthAncor: CGFloat = 100
        static let thirdImageHeightAncor: CGFloat = 100
        static let thirdImageImage = UIImage(named: "pizza3")
        
        static let fourthImageTopAncor: CGFloat = 100
        static let fourthImageWidthAncor: CGFloat = 100
        static let fourthImageHeightAncor: CGFloat = 100
        static let fourthImageImage = UIImage(named: "pizza4")
        
        static let fifthImageTopAncor: CGFloat = 100
        static let fifthImageWidthAncor: CGFloat = 100
        static let fifthImageHeightAncor: CGFloat = 100
        static let fifthImageImage = UIImage(named: "beer5")
        
        static let sixthImageTopAncor: CGFloat = 100
        static let sixthImageWidthAncor: CGFloat = 100
        static let sixthImageHeightAncor: CGFloat = 100
        static let sixthImageImage = UIImage(named: "burger6")
    }
}
