//
//  ViewController.swift
//  UITableViewController
//
//  Created by Алексей Смицкий on 31.08.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: -  ViewController

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var tableViewController = UITableViewController(style: .plain)
    private lazy var registerTable = UITableView()
    private lazy var userDefaults = UserDefaults.standard
    
    private lazy var nameCell = UITableViewCell()
    private lazy var surnameCell = UITableViewCell()
    private lazy var nicknameCell = UITableViewCell()
    private lazy var passwordCell = UITableViewCell()
    private lazy var emailCell = UITableViewCell()
    private lazy var sexCell = UITableViewCell()
    private lazy var pushCell = UITableViewCell()
    
    private lazy var nameLabel = UILabel()
    private lazy var nameField = UITextField()
    
    private lazy var surnameLabel = UILabel()
    private lazy var surnameField = UITextField()
    
    private lazy var nicknameLabel = UILabel()
    private lazy var nicknameField = UITextField()
    
    private lazy var passwordLabel = UILabel()
    private lazy var passwordInsertField = UITextField()
    
    private lazy var emailField = UITextField()
    private lazy var emailLabel = UILabel()
    
    private lazy var sexControll = UISegmentedControl()
    private lazy var sexLabel = UILabel()
    
    private lazy var pushLabel = UILabel()
    private lazy var pushSwitch = UISwitch()
    
    private lazy var saveButton = UIButton()
    private lazy var cellsArray = [nameCell,
                                   surnameCell,
                                   nicknameCell,
                                   passwordCell,
                                   emailCell,
                                   sexCell,
                                   pushCell]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        registerTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerTable.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.registerTableTopAncor),
            registerTable.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            registerTable.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            registerTable.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.registerTableBottomAncor)])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: nameCell.leadingAnchor),
            nameLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            nameLabel.centerYAnchor.constraint(
                equalTo: nameCell.centerYAnchor)])
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.trailingAnchor.constraint(
                equalTo: nameCell.trailingAnchor),
            nameField.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            nameField.centerYAnchor.constraint(
                equalTo: nameCell.centerYAnchor)])
        
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            surnameLabel.leadingAnchor.constraint(
                equalTo: surnameCell.leadingAnchor),
            surnameLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            surnameLabel.centerYAnchor.constraint(
                equalTo: surnameCell.centerYAnchor)])
        
        surnameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            surnameField.trailingAnchor.constraint(
                equalTo: surnameCell.trailingAnchor),
            surnameField.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            surnameField.centerYAnchor.constraint(
                equalTo: surnameCell.centerYAnchor)])
        
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nicknameLabel.leadingAnchor.constraint(
                equalTo: nicknameCell.leadingAnchor),
            nicknameLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            nicknameLabel.centerYAnchor.constraint(
                equalTo: nicknameCell.centerYAnchor)])
        
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nicknameField.trailingAnchor.constraint(
                equalTo: nicknameCell.trailingAnchor),
            nicknameField.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            nicknameField.centerYAnchor.constraint(
                equalTo: nicknameCell.centerYAnchor)])
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(
                equalTo: passwordCell.leadingAnchor),
            passwordLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            passwordLabel.centerYAnchor.constraint(
                equalTo: passwordCell.centerYAnchor)])
        
        passwordInsertField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordInsertField.trailingAnchor.constraint(
                equalTo: passwordCell.trailingAnchor),
            passwordInsertField.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            passwordInsertField.centerYAnchor.constraint(
                equalTo: passwordCell.centerYAnchor)])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(
                equalTo: emailCell.leadingAnchor),
            emailLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            emailLabel.centerYAnchor.constraint(
                equalTo: emailCell.centerYAnchor)])
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailField.trailingAnchor.constraint(
                equalTo: emailCell.trailingAnchor),
            emailField.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            emailField.centerYAnchor.constraint(
                equalTo: emailCell.centerYAnchor)])
        
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sexLabel.leadingAnchor.constraint(
                equalTo: sexCell.leadingAnchor),
            sexLabel.widthAnchor.constraint(
                equalToConstant: Constants.labelsWidthAncor),
            sexLabel.centerYAnchor.constraint(
                equalTo: sexCell.centerYAnchor)])
        
        sexControll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sexControll.trailingAnchor.constraint(
                equalTo: sexCell.trailingAnchor),
            sexControll.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            sexControll.centerYAnchor.constraint(
                equalTo: sexCell.centerYAnchor)])
        
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pushLabel.leadingAnchor.constraint(
                equalTo: pushCell.leadingAnchor),
            pushLabel.widthAnchor.constraint(
                equalToConstant: Constants.pushLabelWidthAncor),
            pushLabel.centerYAnchor.constraint(
                equalTo: pushCell.centerYAnchor)])
        
        pushSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pushSwitch.trailingAnchor.constraint(
                equalTo: pushCell.trailingAnchor),
            pushSwitch.widthAnchor.constraint(
                equalToConstant: Constants.fieldsWidthAncor),
            pushSwitch.centerYAnchor.constraint(
                equalTo: pushCell.centerYAnchor)])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.saveButtonBottomAncor),
            saveButton.widthAnchor.constraint(
                equalToConstant: Constants.saveButtonWidthAncor),
            saveButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(
                equalToConstant: Constants.saveButtonHeightAncor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func saveSettings() {
        userDefaults.setValue(nameField.text, forKey: Constants.userDefaultsName)
        userDefaults.setValue(surnameField.text, forKey: Constants.userDefaultsSurname)
        userDefaults.setValue(emailField.text, forKey: Constants.userDefaultsEmail)
        userDefaults.setValue(passwordInsertField.text, forKey: Constants.userDefaultsPassword)
        userDefaults.setValue(nicknameField.text, forKey: Constants.userDefaultsNickName)
        userDefaults.set(sexControll.selectedSegmentIndex, forKey: Constants.userDefaultsSex)
        userDefaults.set(pushSwitch.isOn, forKey: Constants.userDefaultsPush)
    }
}

// MARK: - Setups

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath)
        
        for _ in cellsArray {
            return cellsArray[indexPath.row]
        }
        
        return cell
    }
}

private extension ViewController {
    
    func setupViews() {
        setMainScreen()
        setNameCell()
        setSurnameCell()
        setNicknameCell()
        setPasswordCell()
        setEmailCell()
        setSexCell()
        setPushCell()
        setSaveButton()
        setUserDefaults()
    }
    
    func setMainScreen() {
        title = Constants.titleText
        registerTable.register(UITableViewCell.self, forCellReuseIdentifier: Constants.identifier)
        registerTable.rowHeight = Constants.registerTableRowHeight
        registerTable.delegate = self
        registerTable.dataSource = self
    }
    
    func setNameCell() {
        nameLabel.text = Constants.nameLabelText
        nameField.placeholder = Constants.nameFieldText
    }
    
    func setSurnameCell() {
        surnameLabel.text = Constants.surnameLabelText
        surnameField.placeholder = Constants.surnameFieldText
    }
    
    func setNicknameCell() {
        nicknameLabel.text = Constants.nicknameLabelText
        nicknameField.placeholder = Constants.nicknameFieldText
    }
    
    func setPasswordCell() {
        passwordLabel.text = Constants.passwordLabelText
        passwordInsertField.placeholder = Constants.passwordFieldText
    }
    
    func setEmailCell() {
        emailLabel.text = Constants.emailLabelText
        emailField.placeholder = Constants.emailFieldText
        emailField.keyboardType = .emailAddress
    }
    
    func setSexCell() {
        sexLabel.text = Constants.sexLabelText
        sexControll.selectedSegmentIndex = Constants.sexSelectedSegment
        sexControll = UISegmentedControl(items: Constants.sexSegmentItems)
    }
    
    func setPushCell() {
        pushLabel.text = Constants.pushLabelText
    }
    
    func setSaveButton() {
        saveButton.setTitle(Constants.saveButtonText, for: .normal)
        saveButton.backgroundColor = Constants.saveButtonColor
        saveButton.layer.cornerRadius = Constants.saveButtonRadius
    }
    
    func setUserDefaults() {
        if let name = userDefaults.object(forKey: Constants.userDefaultsName),
            let surname = userDefaults.object(forKey: Constants.userDefaultsSurname),
            let password = userDefaults.object(forKey: Constants.userDefaultsPassword),
            let email = userDefaults.object(forKey: Constants.userDefaultsEmail),
            let sex = userDefaults.object(forKey: Constants.userDefaultsSex),
            let push = userDefaults.object(forKey: Constants.userDefaultsPush),
            let nickname = userDefaults.object(forKey: Constants.userDefaultsPush) {
            nameField.text = name as? String
            surnameField.text = surname as? String
            passwordInsertField.text = password as? String
            emailField.text = email as? String
            sexControll.selectedSegmentIndex = sex as? Int ?? Constants.sexSelectedSegment
            pushSwitch.isOn = push as? Bool ?? false
            nicknameField.text = nickname as? String
        }
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(registerTable)
        view.addSubview(saveButton)
        
        nameCell.addSubview(nameLabel)
        nameCell.addSubview(nameField)
        
        surnameCell.addSubview(surnameLabel)
        surnameCell.addSubview(surnameField)
        
        nicknameCell.addSubview(nicknameLabel)
        nicknameCell.addSubview(nicknameField)
        
        passwordCell.addSubview(passwordLabel)
        passwordCell.addSubview(passwordInsertField)
        
        emailCell.addSubview(emailLabel)
        emailCell.addSubview(emailField)
        
        sexCell.addSubview(sexLabel)
        sexCell.addSubview(sexControll)
        
        pushCell.addSubview(pushLabel)
        pushCell.addSubview(pushSwitch)
    }
    
    func addActions() {
        saveButton.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let registerTableTopAncor: CGFloat = 50
        static let registerTableBottomAncor: CGFloat = -100
        static let registerTableRowHeight: CGFloat = 70
        static let titleText: String = "Заполните данные"
        static let identifier: String = "registerIdentifier"
        static let numberOfSections: Int = 1
        
        static let labelsWidthAncor: CGFloat = 100
        static let fieldsWidthAncor: CGFloat = 150
        
        static let nameLabelText: String = "Имя"
        static let nameFieldText: String = "Иван"
        
        static let surnameLabelText: String = "Фамилия"
        static let surnameFieldText: String = "Иванов"
        
        static let nicknameLabelText: String = "Никнейм"
        static let nicknameFieldText: String = "ivanIvanov"
        
        static let passwordLabelText: String = "Пароль"
        static let passwordFieldText: String = "12345"
        
        static let emailLabelText: String = "e-mail"
        static let emailFieldText: String = "ivan@mail.ru"
        
        static let sexLabelText: String = "Пол"
        static let sexSegmentItems: [String] = ["М", "Ж"]
        static let sexSelectedSegment: Int   = 0
        
        static let pushLabelText: String = "Получать уведомления"
        static let pushLabelWidthAncor: CGFloat = 250
        
        static let saveButtonText: String = "Сохранить"
        static let saveButtonRadius: CGFloat = 5
        static let saveButtonColor: UIColor = .lightGray
        static let saveButtonBottomAncor: CGFloat = -20
        static let saveButtonWidthAncor: CGFloat = 150
        static let saveButtonHeightAncor: CGFloat = 50
        
        static let userDefaultsName: String = "name"
        static let userDefaultsSurname: String = "surname"
        static let userDefaultsNickName: String = "nickname"
        static let userDefaultsPassword: String = "password"
        static let userDefaultsEmail: String = "email"
        static let userDefaultsSex: String = "sex"
        static let userDefaultsPush: String = "push"
    }
}
