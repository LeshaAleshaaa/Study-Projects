//
//  SecondViewController.swift
//  UIImageView
//
//  Created by Алексей Смицкий on 11.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - SecondViewController

final class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var someImage = UIImageView()
    private lazy var contentLabel = UILabel()
    private lazy var contentModePicker = UIPickerView()
    private lazy var alphaLabel = UILabel()
    private lazy var alphaSlider = UISlider()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Public methods
    
    func image(image: UIImageView) {
        someImage.image = image.image
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        someImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            someImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.someImageTopAncor),
            someImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            someImage.widthAnchor.constraint(
                equalToConstant: Constants.someImageWidthAncor),
            someImage.heightAnchor.constraint(
                equalToConstant: Constants.someImageHeightAncor)])
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(
                equalTo: someImage.bottomAnchor,
                constant: Constants.contenLabelTopAncor),
            contentLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        contentModePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentModePicker.topAnchor.constraint(
                equalTo: contentLabel.bottomAnchor,
                constant: Constants.contentPickerTopAncor),
            contentModePicker.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            contentModePicker.widthAnchor.constraint(
                equalToConstant: Constants.contentPickerWidthAncor),
            contentModePicker.heightAnchor.constraint(
                equalToConstant: Constants.contentPickerHeightAncor)])
        
        alphaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            alphaLabel.topAnchor.constraint(
                equalTo: contentModePicker.bottomAnchor,
                constant: Constants.alphaLabelTopAncor),
            alphaLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        alphaSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            alphaSlider.topAnchor.constraint(
                equalTo: alphaLabel.bottomAnchor,
                constant: Constants.alphaSliderTopAncor),
            alphaSlider.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            alphaSlider.widthAnchor.constraint(
                equalToConstant: Constants.alphaSliderWidthAncor)])
    }
    
    // MARK: - Selectors
    
    @objc func sliderValue(sender: UISlider) {
        let alphaValue = CGFloat(sender.value)
        someImage.alpha = alphaValue
    }
}

// MARK: - Setups

// MARK: - PickerView Setup

extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.contentComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.contentRows
    }
    
}

extension SecondViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return Constants.firstRowText
        case 1:
            return Constants.secondRowText
        case 2:
            return Constants.thirdRowText
        default:
            return Constants.firstRowText
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            someImage.contentMode = .scaleToFill
        case 1:
            someImage.contentMode = .bottomLeft
        case 2:
            someImage.contentMode = .bottomRight
        default:
            break
        }
    }
}

private extension SecondViewController {
    
    func setupView() {
        setContentLabel()
        setContentPicker()
        setAlphaLabel()
        setAlphaSlider()
    }
    
    func setContentLabel() {
        contentLabel.text = Constants.contentLabelText
        contentLabel.font = Constants.contentLabelFont
    }
    
    func setAlphaLabel() {
        alphaLabel.text = Constants.alphaText
        alphaLabel.font = Constants.alphaLabelFont
    }
    
    func setContentPicker() {
        contentModePicker.delegate = self
        contentModePicker.dataSource = self
    }
    
    func setAlphaSlider() {
        alphaSlider.value = Constants.alphaSliderCurrent
        alphaSlider.minimumValue = Constants.alphaSliderMinimum
        alphaSlider.maximumValue = Constants.alphaSliderMaximum
    }
}

// MARK: - Setup Elements

private extension SecondViewController {
    
    func addViews() {
        view.addSubview(someImage)
        view.addSubview(contentLabel)
        view.addSubview(contentModePicker)
        view.addSubview(alphaLabel)
        view.addSubview(alphaSlider)
    }
    
    func addActions() {
        alphaSlider.addTarget(self, action: #selector(sliderValue(sender:)), for: .valueChanged)
    }
}

// MARK: - Constants

private extension SecondViewController {
    
    enum Constants {
        
        static let someImageTopAncor: CGFloat = 100
        static let someImageWidthAncor: CGFloat = 300
        static let someImageHeightAncor: CGFloat = 300
        
        static let contenLabelTopAncor: CGFloat = 20
        static let contentLabelFont: UIFont = .boldSystemFont(ofSize: 20)
        static let contentLabelText: String = "Вариант расположения"
        
        static let contentPickerTopAncor: CGFloat = 20
        static let contentPickerWidthAncor: CGFloat = 300
        static let contentPickerHeightAncor: CGFloat = 80
        static let contentComponents: Int = 1
        static let contentRows: Int = 3
        static let firstRowText: String = "Стандартный"
        static let secondRowText: String = "Смещенный вправо"
        static let thirdRowText: String = "Смещенный влево"
        
        
        static let alphaText: String = "Уровень прозрачности"
        static let alphaLabelTopAncor: CGFloat = 20
        static let alphaLabelFont: UIFont = .boldSystemFont(ofSize: 20)
        
        static let alphaSliderTopAncor: CGFloat = 20
        static let alphaSliderWidthAncor: CGFloat = 300
        static let alphaSliderCurrent: Float = 1
        static let alphaSliderMinimum: Float = 0.1
        static let alphaSliderMaximum: Float = 1
    }
}
