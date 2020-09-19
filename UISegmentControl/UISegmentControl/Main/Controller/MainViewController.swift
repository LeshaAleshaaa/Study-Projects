//
//  ViewController.swift
//  UISegmentControl
//
//  Created by Алексей Смицкий on 24.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let phones = [
        Phones(namePhone: "iPhone SE"),
        Phones(namePhone: "iPhone 11"),
        Phones(namePhone: "iPhone 11 Pro")]
    
    private lazy var shopNameLabel = UILabel()
    private lazy var pickItemsLabel = UILabel()
    private lazy var itemsImages = UIImageView()
    private lazy var itemsSegment = UISegmentedControl()
    private lazy var buyItems = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        shopNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.shopNameLabelTopAnchor),
            shopNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            shopNameLabel.heightAnchor.constraint(
                equalToConstant: Constants.shopNameLabelHeightAnchor)])
        
        pickItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickItemsLabel.topAnchor.constraint(
                equalTo: shopNameLabel.bottomAnchor,
                constant: Constants.pickItemsLabelTopAnchor),
            pickItemsLabel.centerXAnchor.constraint(
                equalTo: shopNameLabel.centerXAnchor),
            pickItemsLabel.heightAnchor.constraint(
                equalToConstant: Constants.pickItemsLabelHeightAnchor)])
        
        itemsSegment.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemsSegment.topAnchor.constraint(
                equalTo: pickItemsLabel.bottomAnchor,
                constant: Constants.itemsSegmentTopAncor),
            itemsSegment.centerXAnchor.constraint(
                equalTo: pickItemsLabel.centerXAnchor),
            itemsSegment.widthAnchor.constraint(
                equalToConstant: Constants.itemsSegmentWightAncor),
            itemsSegment.heightAnchor.constraint(
                equalToConstant: Constants.itemsSegmentHeightAncor)])
        
        itemsImages.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemsImages.topAnchor.constraint(
                equalTo: itemsSegment.bottomAnchor,
                constant: Constants.itemsImagesTopAncor),
            itemsImages.centerXAnchor.constraint(
                equalTo: itemsSegment.centerXAnchor),
            itemsImages.widthAnchor.constraint(
                equalToConstant: Constants.itemsImagesWidthAncor),
            itemsImages.heightAnchor.constraint(
                equalToConstant: Constants.itemSImagesHeightAncor)
        ])
        
        buyItems.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buyItems.topAnchor.constraint(
                equalTo: itemsImages.bottomAnchor,
                constant: Constants.buyItemsTopAncor),
            buyItems.centerXAnchor.constraint(
                equalTo: itemsImages.centerXAnchor),
            buyItems.widthAnchor.constraint(
                equalToConstant: Constants.buyItemsWidthAncor),
            buyItems.heightAnchor.constraint(
                equalToConstant: Constants.buyItemsHeightAncor)
        ])
    }
    
    // MARK: - itemsSegmentParsing
    
    private func itemsSegmentParsing() {
        var stringArray = [String]()
        for index in phones {
            stringArray.append(index.namePhone)
        }
        itemsSegment = UISegmentedControl(items: stringArray)
    }
    
    // MARK: - Selectors
    
    @objc
    private func chooseItem(segment: UISegmentedControl) {
        if segment == itemsSegment {
            let segmentIndex = segment.selectedSegmentIndex
            let imageArray = [UIImage(named: "iPhone SE"), UIImage(named: "iPhone 11"), UIImage(named: "iPhone 11 Pro")]
            itemsImages.image = imageArray[segmentIndex]
        }
    }
    
    @objc
    private func buyAlert() {
        alertTitleAndMessage(title: "Спасибо за покупку!", message: "", buttonTitle: "Ок")
    }
}

// MARK: - Setups

private extension MainViewController {
    
    func setupView() {
        setShopNameLabel()
        setPickItemsLabel()
        itemsSegmentParsing()
        setBuyItems()
    }
}

// MARK: - Setup Elements

private extension MainViewController {
    
    func addViews() {
        view.addSubview(shopNameLabel)
        view.addSubview(pickItemsLabel)
        view.addSubview(buyItems)
        view.addSubview(itemsSegment)
        view.addSubview(itemsImages)
        view.addSubview(buyItems)
    }
    
    func addActions() {
        itemsSegment.addTarget(self, action: #selector(chooseItem(segment:)), for: .valueChanged)
        buyItems.addTarget(self, action: #selector(buyAlert), for: .touchDown)
    }
    
    func setShopNameLabel() {
        shopNameLabel.text = Constants.shopNameLabelText
    }
    
    func setPickItemsLabel() {
        pickItemsLabel.text = Constants.pickItemsLabelText
    }
    
    func setBuyItems() {
        buyItems.setTitle(Constants.buyItemsTitle, for: .normal)
        buyItems.backgroundColor = Constants.buyItemsBackgroundColor
    }
}

// MARK: - Constants

private extension MainViewController {
    
    enum Constants {
        static let shopNameLabelText: String = "re:Store (APR)"
        static let shopNameLabelTopAnchor: CGFloat = 20
        static let shopNameLabelHeightAnchor: CGFloat = 30
        
        static let pickItemsLabelText: String = "Выберите модель iPhone"
        static let pickItemsLabelTopAnchor: CGFloat = 10
        static let pickItemsLabelHeightAnchor: CGFloat = 30
        
        static let itemsSegmentTopAncor: CGFloat = 10
        static let itemsSegmentWightAncor: CGFloat = 300
        static let itemsSegmentHeightAncor: CGFloat = 30
        
        static let itemsImagesTopAncor: CGFloat = 10
        static let itemsImagesWidthAncor: CGFloat = 200
        static let itemSImagesHeightAncor: CGFloat = 250
        
        static let buyItemsTitle: String = "Купить"
        static let buyItemsBackgroundColor: UIColor = .gray
        static let buyItemsTopAncor: CGFloat = 50
        static let buyItemsWidthAncor: CGFloat = 200
        static let buyItemsHeightAncor: CGFloat = 50
    }
}
