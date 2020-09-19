//
//  ViewController.swift
//  UITabBarVC
//
//  Created by Алексей Смицкий on 31.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - InfoViewController

final class InfoViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var stepNumber = UILabel()
    private lazy var stepImage = UIImageView()
    private lazy var stepText = UITextView()
    private lazy var nextButton = UIButton()
    private lazy var backButton = UIButton()
    private lazy var closeBarButton = UIButton()
    
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
        
        stepNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepNumber.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.stepNumberTopAncor),
            stepNumber.heightAnchor.constraint(
                equalToConstant: Constants.stepNumberHeightAncor),
            stepNumber.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        stepImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepImage.topAnchor.constraint(
                equalTo: stepNumber.bottomAnchor,
                constant: Constants.stepImageTopAncor),
            stepImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            stepImage.widthAnchor.constraint(
                equalToConstant: Constants.stepImageWidthAncor),
            stepImage.heightAnchor.constraint(
                equalToConstant: Constants.stepImageHeightAncor)])
        
        stepText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stepText.topAnchor.constraint(
                equalTo: stepImage.bottomAnchor,
                constant: Constants.stepTextTopAncor),
            stepText.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            stepText.widthAnchor.constraint(
                equalToConstant: Constants.stepTextWidthAncor),
            stepText.heightAnchor.constraint(
                equalToConstant: Constants.stepImageHeightAncor)])
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.nextButtonTrailingAncor),
            nextButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.nextButtonBottomAncor),
            nextButton.widthAnchor.constraint(
                equalToConstant: Constants.nextButtonWidthAncor),
            nextButton.heightAnchor.constraint(
                equalToConstant: Constants.nextButtonHeightAncor)])
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.backButtonLeadingAncor),
            backButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.backButtonBottomAncor),
            backButton.widthAnchor.constraint(
                equalToConstant: Constants.backButtonWidthAncor),
            backButton.heightAnchor.constraint(
                equalToConstant: Constants.backButtonHeightAncor)])
    }
    
    private func secondStep() {
        stepNumber.text = Constants.stepNumberSecondText
        stepText.text = Constants.stepTextSecondText
        stepImage.image = Constants.stepImageSecond
        backButton.isHidden = false
        nextButton.isHidden = false
    }
    
    private func thirdStep() {
        stepNumber.text = Constants.stepNumberThirdText
        stepText.text = Constants.stepTextThirdText
        nextButton.isHidden = true
    }
    
    //MARK: - Selectors
    
    @objc
    private func stepTap(button: UIButton) {
        switch button {
        case nextButton:
            switch stepNumber.text {
            case "Первый шаг":
                secondStep()
            case "Второй шаг":
                thirdStep()
            default:
                break
            }
        case backButton:
            if stepNumber.text == "Второй шаг" {
                setupView()
            } else {
                secondStep()
            }
        default:
            break
        }
    }
    
    @objc
    private func closeController() {
        
        let alert = UIAlertController(title: "Спасибо, что воспользовались нашей инструкцией!", message: "", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Спасибо!", style: .default, handler: nil)
        
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Setups

private extension InfoViewController {
    
    func setupView() {
        setStepNumber()
        setStepImage()
        setStepText()
        setNextButton()
        setNaviBar()
        setBackButton()
    }
    
    func setStepNumber() {
        stepNumber.text = Constants.stepNumberText
    }
    
    func setStepImage() {
        stepImage.image = Constants.stepImageImage
    }
    
    func setStepText() {
        stepText.text = Constants.stepTextText
        stepText.isEditable = false
    }
    
    func setNextButton() {
        nextButton.setImage(Constants.nextButtonImage, for: .normal)
        nextButton.contentMode = .scaleAspectFill
    }
    
    func setBackButton() {
        backButton.isHidden = true
        backButton.setImage(Constants.backButtonImage, for: .normal)
        backButton.contentMode = .scaleAspectFill
    }
    
    func setNaviBar() {
        closeBarButton.setImage(Constants.closeBarButtonImage, for: .normal)
        closeBarButton.contentMode = .scaleAspectFill
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeBarButton)
    }
}

// MARK: - Setup Elements

private extension InfoViewController {
    
    func addViews() {
        view.addSubview(stepNumber)
        view.addSubview(stepImage)
        view.addSubview(stepText)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
    }
    
    func addActions() {
        nextButton.addTarget(self, action: #selector(stepTap(button:)), for: .touchDown)
        backButton.addTarget(self, action: #selector(stepTap(button:)), for: .touchDown)
        closeBarButton.addTarget(self, action: #selector(closeController), for: .touchDown)
    }
}

// MARK: - Constants

private extension InfoViewController {
    
    enum Constants {
        
        static let stepNumberTopAncor: CGFloat = 70
        static let stepNumberHeightAncor: CGFloat = 50
        static let stepNumberText: String = "Первый шаг"
        static let stepNumberSecondText: String = "Второй шаг"
        static let stepNumberThirdText: String = "Третий шаг"
        
        static let stepImageTopAncor: CGFloat = 20
        static let stepImageWidthAncor: CGFloat = 250
        static let stepImageHeightAncor: CGFloat = 300
        static let stepImageImage = UIImage(named: "firstStep")
        static let stepImageSecond = UIImage(named: "secondthird")
        
        static let stepTextTopAncor: CGFloat = 20
        static let stepTextWidthAncor: CGFloat = 200
        static let stepTextHeightAcnor: CGFloat = 1
        static let stepTextText: String =
        """
        Подключите устройство к сети Wi-Fi.

        Перейдите в меню «Настройки» > [ваше имя] и выберите iCloud.
        """
        static let stepTextSecondText: String =
        """
        Выберите «Копия iCloud»
        """
        static let stepTextThirdText: String =
        """
        Нажмите «Создать резервную копию». Не отключайтесь от сети Wi-Fi до завершения процесса.
        """
        
        static let nextButtonBottomAncor: CGFloat = -70
        static let nextButtonTrailingAncor: CGFloat = -50
        static let nextButtonWidthAncor: CGFloat = 100
        static let nextButtonHeightAncor: CGFloat = 30
        static let nextButtonImage = UIImage(named: "next")
        
        static let backButtonLeadingAncor: CGFloat = 50
        static let backButtonBottomAncor: CGFloat = -70
        static let backButtonWidthAncor: CGFloat = 100
        static let backButtonHeightAncor: CGFloat = 30
        static let backButtonImage = UIImage(named: "back")
        
        static let closeBarButtonImage = UIImage(named: "close")
    }
}
