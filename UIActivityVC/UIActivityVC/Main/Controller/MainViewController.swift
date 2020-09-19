//
//  ViewController.swift
//  UIActivityVC
//
//  Created by Алексей Смицкий on 26.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let photoLabel = UILabel()
    private var photoSegment = UISegmentedControl()
    private let sharePicker = UIPickerView()
    private let photosArray = [
        Photos(photoName: "Море"),
        Photos(photoName: "Горы"),
        Photos(photoName: "Лес")]
    
    // MARK: - Public properties
    
    public let imageView = UIImageView()
    
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
        
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.photoLabelTopAncor),
            photoLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            photoLabel.widthAnchor.constraint(
                equalToConstant: Constants.photoLabelWidthAncor),
            photoLabel.heightAnchor.constraint(
                equalToConstant: Constants.photoLabelHeightAncor)])
        
        photoSegment.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoSegment.topAnchor.constraint(
                equalTo: photoLabel.bottomAnchor,
                constant: Constants.photoSegmentTopAncor),
            photoSegment.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            photoSegment.widthAnchor.constraint(
                equalToConstant: Constants.photoSegmentWidthAncor),
            photoSegment.heightAnchor.constraint(
                equalToConstant: Constants.photoSegmentHeightAncor)])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: photoSegment.bottomAnchor,
                constant: Constants.imageViewTopAncor),
            imageView.centerXAnchor.constraint(
                equalTo: photoSegment.centerXAnchor),
            imageView.widthAnchor.constraint(
                equalToConstant: Constants.imageViewWidthAncor),
            imageView.heightAnchor.constraint(
                equalToConstant: Constants.imageViewHeightAncor),
        ])
        
        sharePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sharePicker.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Constants.sharePickerTopAncor),
            sharePicker.centerXAnchor.constraint(
                equalTo: imageView.centerXAnchor),
            sharePicker.widthAnchor.constraint(
                equalToConstant: Constants.sharePickerWidthAncor),
            sharePicker.heightAnchor.constraint(
                equalToConstant: Constants.sharePickerHeightAncor)])
    }
    
    // MARK: - photoSegmentParsing
    
    private func photoSegmentParsing() {
        var stringArray = [String]()
        for index in photosArray {
            stringArray.append(index.photoName)
        }
        photoSegment = UISegmentedControl(items: stringArray)
    }
    
    //MARK: - Selectors
    
    @objc
    private func chooseItem(segment: UISegmentedControl) {
        if segment == photoSegment {
            let segmentIndex = segment.selectedSegmentIndex
            let imageArray = [UIImage(named: "sea"), UIImage(named: "mountains"), UIImage(named: "wood")]
            imageView.image = imageArray[segmentIndex]
        }
    }
}

// MARK: - Setups

private extension MainViewController {
    
    func setupView() {
        setPhotoLabel()
        photoSegmentParsing()
        setSharePicker()
    }
    
    func setPhotoLabel() {
        photoLabel.text = Constants.photoLabelText
    }
    
    
    func setSharePicker() {
        sharePicker.dataSource = self
        sharePicker.delegate = self
    }
}

// MARK: - Setup Elements

private extension MainViewController {
    
    func addViews() {
        view.addSubview(photoLabel)
        view.addSubview(photoSegment)
        view.addSubview(imageView)
        view.addSubview(sharePicker)
    }
    
    func addActions() {
        photoSegment.addTarget(self, action: #selector(chooseItem(segment:)), for: .valueChanged)
    }
}

// MARK: - Constants

private extension MainViewController {
    
    enum Constants {
        static let photoLabelText: String = "Выберите фотографию"
        static let photoLabelTopAncor: CGFloat = 20
        static let photoLabelWidthAncor: CGFloat = 200
        static let photoLabelHeightAncor: CGFloat = 30
        
        static let photoSegmentTopAncor: CGFloat = 20
        static let photoSegmentWidthAncor: CGFloat = 300
        static let photoSegmentHeightAncor: CGFloat = 30
        
        static let imageViewTopAncor: CGFloat = 20
        static let imageViewWidthAncor: CGFloat = 300
        static let imageViewHeightAncor: CGFloat = 300
        
        static let sharePickerTopAncor: CGFloat = 20
        static let sharePickerWidthAncor: CGFloat = 300
        static let sharePickerHeightAncor: CGFloat = 100
    }
}
