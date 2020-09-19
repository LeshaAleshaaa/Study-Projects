//
//  ViewController.swift
//  UILabel
//
//  Created by Алексей Смицкий on 04.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var mainLabel = UILabel()
    private lazy var addTextButton = UIButton()
    private lazy var textColorPicker = UIPickerView()
    private lazy var textCountPicker = UIPickerView()
    private lazy var textStylePicker = UIPickerView()
    private lazy var textSizeSlider = UISlider()
    private lazy var colorsNameArray = ["Черный", "Зеленый", "Красный"]
    private lazy var countOfLines = ["1", "2", "3"]
    private lazy var styleArray = ["Без тени", "С тенью", "Тень + Фон"]
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Public methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case textColorPicker:
            return colorsNameArray[row]
        case textStylePicker:
            return styleArray[row]
        case textCountPicker:
            return countOfLines[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (pickerView, row) {
        case (textColorPicker, 0):
            mainLabel.textColor = .black
        case (textColorPicker, 1):
            mainLabel.textColor = .green
        case (textColorPicker, 2):
            mainLabel.textColor = .red
            
        case (textCountPicker, 0):
            mainLabel.numberOfLines = 1
        case (textCountPicker, 1):
            mainLabel.numberOfLines = 2
        case (textCountPicker, 2):
            mainLabel.numberOfLines = 3
            
        case (textStylePicker, 0):
            mainLabel.shadowColor = .none
        case (textStylePicker, 1):
            mainLabel.shadowColor = .black
            mainLabel.backgroundColor = .clear
            mainLabel.shadowOffset = CGSize(width: 2, height: 2)
        case (textStylePicker, 2):
            mainLabel.backgroundColor = .yellow
            mainLabel.shadowColor = .black
            mainLabel.shadowOffset = CGSize(width: 2, height: 2)
        default:
            break
        }
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.mainLabelTopAncor),
            mainLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            mainLabel.widthAnchor.constraint(
                equalToConstant: Constants.mainLabelWidthAncor)])
        
        textColorPicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textColorPicker.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            textColorPicker.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            textColorPicker.widthAnchor.constraint(
                equalToConstant: Constants.textColorPickerWidthAncor),
            textColorPicker.heightAnchor.constraint(
                equalToConstant: Constants.textColorPickerHeightAncor)])
        
        textCountPicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textCountPicker.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            textCountPicker.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            textCountPicker.widthAnchor.constraint(
                equalToConstant: Constants.textCountPickerWidthAncor),
            textCountPicker.heightAnchor.constraint(
                equalToConstant: Constants.textCountPickerHeightAncor)])
        
        textStylePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textStylePicker.topAnchor.constraint(
                equalTo: textCountPicker.bottomAnchor,
                constant: Constants.textStylePickerTopAncor),
            textStylePicker.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            textStylePicker.widthAnchor.constraint(
                equalToConstant: Constants.textStylePickerWidthAncor),
            textStylePicker.heightAnchor.constraint(
                equalToConstant: Constants.textStylePickerHeightAncoer)])
        
        textSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textSizeSlider.topAnchor.constraint(
                equalTo: textStylePicker.bottomAnchor,
                constant: Constants.textSizeSliderTopAncor),
            textSizeSlider.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            textSizeSlider.widthAnchor.constraint(
                equalToConstant: Constants.textSizeSliderWidthAncor),
            textSizeSlider.heightAnchor.constraint(
                equalToConstant: Constants.textSizeSliderHeightAncor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func changeTextSize(sender: UISlider) {
        
        let fontSize = Int(sender.value)
        let font = mainLabel.font.withSize(CGFloat(fontSize))
        mainLabel.font = font
    }
    
    @objc
    private func addtext() {
        
        let alertController = UIAlertController(title: "Введите текст для редактирования", message: "", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Приступить", style: .default) {
            [weak self] (action) in
            let textField = alertController.textFields?.first?.text
            
            if textField?.count == 0 {
                self?.mainLabel.text = "Вы ничего не ввели, попробуйте еще раз"
            } else {
                self?.mainLabel.text = textField
            }
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(doneButton)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupView() {
        setPickerViews()
        setAddTextButton()
        setTextSizeSlider()
    }
    
    func setPickerViews() {
        
        textColorPicker.delegate = self
        textColorPicker.dataSource = self
        textCountPicker.delegate = self
        textCountPicker.dataSource = self
        textStylePicker.dataSource = self
        textStylePicker.delegate = self
    }
    
    func setAddTextButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTextButton)
        addTextButton.setImage(Constants.addTextButtonImage, for: .normal)
        addTextButton.contentMode = .scaleAspectFit
    }
    
    func setTextSizeSlider() {
        textSizeSlider.minimumValue = 7
        textSizeSlider.maximumValue = 50
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(mainLabel)
        view.addSubview(textColorPicker)
        view.addSubview(textStylePicker)
        view.addSubview(textSizeSlider)
        view.addSubview(textCountPicker)
    }
    
    func addActions() {
        textSizeSlider.addTarget(self, action: #selector(changeTextSize), for: .valueChanged)
        addTextButton.addTarget(self, action: #selector(addtext), for: .touchUpInside)
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let addTextButtonImage = UIImage(named: "plus")
        
        static let mainLabelTopAncor: CGFloat = 100
        static let mainLabelWidthAncor: CGFloat = 200
        
        static let textColorPickerWidthAncor: CGFloat = 170
        static let textColorPickerHeightAncor: CGFloat = 70
        
        static let textCountPickerWidthAncor: CGFloat = 170
        static let textCountPickerHeightAncor: CGFloat = 70
        
        static let textStylePickerTopAncor: CGFloat = 10
        static let textStylePickerWidthAncor: CGFloat = 200
        static let textStylePickerHeightAncoer: CGFloat = 70
        
        static let textSizeSliderTopAncor: CGFloat = 20
        static let textSizeSliderWidthAncor: CGFloat = 300
        static let textSizeSliderHeightAncor: CGFloat = 50
    }
}
