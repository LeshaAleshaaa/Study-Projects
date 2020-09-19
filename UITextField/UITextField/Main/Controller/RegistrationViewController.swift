//
//  ViewController.swift
//  UITextField
//
//  Created by Алексей Смицкий on 06.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - RegistrationViewController

final class RegistrationViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var registrationLabel = UILabel()
    private lazy var firstNameTextField = UITextField()
    private lazy var lastNameTextField = UITextField()
    private lazy var eMailTextField = UITextField()
    private lazy var passWordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
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
        
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.registrationLabelTopAncor),
            registrationLabel.widthAnchor.constraint(
                equalToConstant: Constants.registrationLabelWidthAncor),
            registrationLabel.heightAnchor.constraint(
                equalToConstant: Constants.registrationLabelHeightAncor),
            registrationLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(
                equalTo: registrationLabel.bottomAnchor,
                constant: Constants.firstNameTextFieldTopAncor),
            firstNameTextField.widthAnchor.constraint(
                equalToConstant: Constants.firstNameTextFieldWidthAncor),
            firstNameTextField.heightAnchor.constraint(
                equalToConstant: Constants.firstNameTextFieldHeightAncor),
            firstNameTextField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(
                equalTo: firstNameTextField.bottomAnchor,
                constant: Constants.lastNameTextFieldTopAncor),
            lastNameTextField.widthAnchor.constraint(
                equalToConstant: Constants.lastNameTextFieldWidthAcnor),
            lastNameTextField.heightAnchor.constraint(
                equalToConstant: Constants.lastNameTextFieldHeightAncor),
            lastNameTextField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        eMailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eMailTextField.topAnchor.constraint(
                equalTo: lastNameTextField.bottomAnchor,
                constant: Constants.eMailTextFieldTopAncor),
            eMailTextField.widthAnchor.constraint(
                equalToConstant: Constants.eMailTextFieldWidthAncor),
            eMailTextField.heightAnchor.constraint(
                equalToConstant: Constants.eMailTextFieldHeightAncor),
            eMailTextField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        passWordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passWordTextField.topAnchor.constraint(
                equalTo: eMailTextField.bottomAnchor,
                constant: Constants.passWordTextFieldTopAncor),
            passWordTextField.widthAnchor.constraint(
                equalToConstant: Constants.passWordTextFieldWidthAncor),
            passWordTextField.heightAnchor.constraint(
                equalToConstant: Constants.passWordTextFieldHeightAncor),
            passWordTextField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(
                equalTo: passWordTextField.bottomAnchor,
                constant: Constants.loginButtonTopAncor),
            loginButton.widthAnchor.constraint(
                equalToConstant: Constants.loginButtonWidthAncor),
            loginButton.heightAnchor.constraint(
                equalToConstant: Constants.loginButtonHeightAncor),
            loginButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func login() {
        guard firstNameTextField.text == "" || lastNameTextField.text == "" || eMailTextField.text == "" || passWordTextField.text == "" else {
            UserDefaults.standard.set(true, forKey: "login")
            let secondViewController = SecondViewController()
            present(secondViewController, animated: true , completion: nil)
            return
        }
        presentAlert(withTitle: "Внимание", message: "Вы ввели не все данные")
        
    }
}

// MARK: - Setups

private extension RegistrationViewController {
    
    func setupView() {
        setRegistrationLabel()
        setFirstNameTextField()
        setLastNameTextField()
        setEmailTextField()
        setPasswordTextField()
        setNotification()
        setLoginButton()
    }
    
    func setRegistrationLabel() {
        registrationLabel.text = Constants.registrationLabelText
        registrationLabel.textAlignment = .center
        registrationLabel.font = Constants.registrationLabelFontSize
        registrationLabel.textColor = .lightGray
    }
    
    func setFirstNameTextField() {
        firstNameTextField.delegate = self
        firstNameTextField.placeholder = Constants.firstNameTextFieldPlaceholder
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.textAlignment = .center
    }
    
    func setLastNameTextField() {
        lastNameTextField.delegate = self
        lastNameTextField.placeholder = Constants.lastNameTextFieldPlaceholder
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.textAlignment = .center
    }
    
    func setEmailTextField() {
        eMailTextField.delegate = self
        eMailTextField.placeholder = Constants.eMailTextFieldPlaceholder
        eMailTextField.borderStyle = .roundedRect
        eMailTextField.textAlignment = .center
        eMailTextField.keyboardType = .emailAddress
    }
    
    func setPasswordTextField() {
        passWordTextField.delegate = self
        passWordTextField.placeholder = Constants.passWordTextFieldPlaceholder
        passWordTextField.borderStyle = .roundedRect
        passWordTextField.textAlignment = .center
        passWordTextField.isSecureTextEntry = true
        passWordTextField.textContentType = .oneTimeCode
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = Constants.notificationViewScroll
            
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = Constants.notificationViewOrigin
        }
    }
    
    func setLoginButton() {
        loginButton.setTitle(Constants.loginButtonTitle, for: .normal)
        loginButton.backgroundColor = Constants.loginButtonColor
        loginButton.layer.cornerRadius = Constants.loginButtonRadius
    }
}

// MARK: - Setup Elements

private extension RegistrationViewController {
    
    func addViews() {
        view.addSubview(registrationLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(eMailTextField)
        view.addSubview(passWordTextField)
        view.addSubview(loginButton)
    }
    
    func addActions() {
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
}

// MARK: - TextField Extensions

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            eMailTextField.becomeFirstResponder()
        case eMailTextField:
            passWordTextField.becomeFirstResponder()
        case passWordTextField:
            textField.resignFirstResponder()
        default:
            break
        }
    }
}

// MARK: - Constants

private extension RegistrationViewController {
    
    enum Constants {
        
        static let registrationLabelTopAncor: CGFloat = 30
        static let registrationLabelWidthAncor: CGFloat = 200
        static let registrationLabelHeightAncor: CGFloat = 50
        static let registrationLabelText: String = "Smith App"
        static let registrationLabelFontSize: UIFont = .boldSystemFont(ofSize: 25)
        
        static let firstNameTextFieldTopAncor: CGFloat = 50
        static let firstNameTextFieldWidthAncor: CGFloat = 300
        static let firstNameTextFieldHeightAncor: CGFloat = 50
        static let firstNameTextFieldPlaceholder: String = "Ваше имя"
        
        static let lastNameTextFieldTopAncor: CGFloat = 50
        static let lastNameTextFieldWidthAcnor: CGFloat = 300
        static let lastNameTextFieldHeightAncor: CGFloat = 50
        static let lastNameTextFieldPlaceholder: String = "Ваша фамилия"
        
        static let eMailTextFieldTopAncor: CGFloat = 50
        static let eMailTextFieldWidthAncor: CGFloat = 300
        static let eMailTextFieldHeightAncor: CGFloat = 50
        static let eMailTextFieldPlaceholder: String = "E-mail"
        
        static let passWordTextFieldTopAncor: CGFloat = 50
        static let passWordTextFieldWidthAncor: CGFloat = 300
        static let passWordTextFieldHeightAncor: CGFloat = 50
        static let passWordTextFieldPlaceholder: String = "Пароль"
        
        static let loginButtonTopAncor: CGFloat = 50
        static let loginButtonWidthAncor: CGFloat = 300
        static let loginButtonHeightAncor: CGFloat = 50
        static let loginButtonTitle: String = "Войти"
        static let loginButtonColor: UIColor = .lightGray
        static let loginButtonRadius: CGFloat = 5
        
        static let notificationViewScroll: CGFloat = -70
        static let notificationViewOrigin: CGFloat = 0.0
    }
}
