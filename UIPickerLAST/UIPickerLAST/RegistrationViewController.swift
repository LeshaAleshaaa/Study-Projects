//
//  RegistrationViewController.swift
//  UI-Kit (lesson 5, UIPicker)
//
//  Created by Алексей Смицкий on 22.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: Registration ViewController

final class RegistrationViewController: UIViewController {
    
    //MARK: Propertys
    
    private lazy var name = UITextField()
    private lazy var surname = UITextField()
    private lazy var password = UITextField()
    private lazy var cardNumber = UITextField()
    private lazy var email = UITextField()
    private lazy var devLanguage = UITextField()
    private lazy var devWorkCount = UITextField()
    private lazy var clientButton = UIButton()
    private lazy var devButton = UIButton()
    private lazy var nameLabel = UILabel()
    private lazy var surnameLabel = UILabel()
    private lazy var passwordLabel = UILabel()
    private lazy var cardNumberLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var devLanguageLabel = UILabel()
    private lazy var devWorkCountLabel = UILabel()
    private lazy var someColor = UIColor.black
    private lazy var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Loading Client Method
    
    //Загрузка экрана в качестве клиента
    private func loadingClientView() {
        
        //Добавление вью на экран
        view.backgroundColor = .white
        view.addSubview(name)
        view.addSubview(surname)
        view.addSubview(password)
        view.addSubview(cardNumber)
        view.addSubview(email)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(cardNumberLabel)
        view.addSubview(emailLabel)
        view.addSubview(saveButton)
        
        //Выставление координат
        name.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        surname.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        password.frame = CGRect(x: 100, y: 150, width: 200, height: 50)
        cardNumber.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        email.frame = CGRect(x: 100, y: 250, width: 200, height: 50)
        nameLabel.frame = CGRect(x: 10, y: 50, width: 80, height: 50)
        surnameLabel.frame = CGRect(x: 10, y: 100, width: 80, height: 50)
        passwordLabel.frame = CGRect(x: 10, y: 150, width: 80, height: 50)
        cardNumberLabel.frame = CGRect(x: 10, y: 200, width: 80, height: 50)
        emailLabel.frame = CGRect(x: 10, y: 250, width: 200, height: 50)
        saveButton.frame = CGRect(x: 10, y: 350, width: 200, height: 50)
        
        //Присвоение значений и отслеживание изменений
        nameLabel.text = "Имя:"
        surnameLabel.text = "Фамилия:"
        passwordLabel.text = "Пароль:"
        cardNumberLabel.text = "Карта:"
        emailLabel.text = "E-mail:"
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .gray
        saveButton.addTarget(self, action: #selector(informationAlert), for: .touchDown)
        
        //Выставление рамки для текстовых полей
        name.layer.borderColor = someColor.cgColor
        surname.layer.borderColor = someColor.cgColor
        password.layer.borderColor = someColor.cgColor
        cardNumber.layer.borderColor = someColor.cgColor
        email.layer.borderColor = someColor.cgColor
        name.layer.borderWidth = 1
        surname.layer.borderWidth = 1
        password.layer.borderWidth = 1
        cardNumber.layer.borderWidth = 1
        email.layer.borderWidth = 1
    }
    
    //MARK: Loading Developer Method
    
    private func loadingDevView() {
        
        //Добавление вью на экран
        view.backgroundColor = .white
        view.addSubview(name)
        view.addSubview(surname)
        view.addSubview(password)
        view.addSubview(cardNumber)
        view.addSubview(email)
        view.addSubview(devLanguage)
        view.addSubview(devWorkCount)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(cardNumberLabel)
        view.addSubview(emailLabel)
        view.addSubview(devLanguageLabel)
        view.addSubview(devWorkCountLabel)
        view.addSubview(saveButton)
        
        //Выставление координат
        name.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        surname.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        password.frame = CGRect(x: 100, y: 150, width: 200, height: 50)
        cardNumber.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        email.frame = CGRect(x: 100, y: 250, width: 200, height: 50)
        devLanguage.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        devWorkCount.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        nameLabel.frame = CGRect(x: 10, y: 50, width: 80, height: 50)
        surnameLabel.frame = CGRect(x: 10, y: 100, width: 80, height: 50)
        passwordLabel.frame = CGRect(x: 10, y: 150, width: 80, height: 50)
        cardNumberLabel.frame = CGRect(x: 10, y: 200, width: 80, height: 50)
        emailLabel.frame = CGRect(x: 10, y: 250, width: 250, height: 50)
        devLanguageLabel.frame = CGRect(x: 10, y: 300, width: 80, height: 50)
        devWorkCountLabel.frame = CGRect(x: 10, y: 350, width: 80, height: 50)
        saveButton.frame = CGRect(x: 10, y: 450, width: 200, height: 50)
        
        //Присвоение значений и отслеживание изменений
        nameLabel.text = "Имя:"
        surnameLabel.text = "Фамилия:"
        passwordLabel.text = "Пароль:"
        cardNumberLabel.text = "Карта:"
        emailLabel.text = "E-mail:"
        devLanguageLabel.text = "Язык:"
        devWorkCountLabel.text = "Опыт:"
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .gray
        saveButton.addTarget(self, action: #selector(informationAlert), for: .touchDown)
        
        //Выставление рамки для текстовых полей
        name.layer.borderColor = someColor.cgColor
        surname.layer.borderColor = someColor.cgColor
        password.layer.borderColor = someColor.cgColor
        cardNumber.layer.borderColor = someColor.cgColor
        email.layer.borderColor = someColor.cgColor
        devLanguage.layer.borderColor = someColor.cgColor
        devWorkCount.layer.borderColor = someColor.cgColor
        name.layer.borderWidth = 1
        surname.layer.borderWidth = 1
        password.layer.borderWidth = 1
        cardNumber.layer.borderWidth = 1
        email.layer.borderWidth = 1
        devLanguage.layer.borderWidth = 1
        devWorkCount.layer.borderWidth = 1
        
    }
    
    //Проверка кнопки
    func checkButton(which: Int) {
        switch which {
        case 1:
            loadingClientView()
        case 2:
            loadingDevView()
        default:
            break
        }
    }
    
    //MARK: Information selector
    @objc
    private func informationAlert() {
        let alertController = UIAlertController(title: "Ваши данные", message: String(), preferredStyle: .alert)
        
        //Кнопка выхода из алерта
        let doneButton = UIAlertAction(title: "Спасибо", style: .default) { (done) in
        }
        
        alertController.addAction(doneButton)
        alertController.message = "Спасибо за регистрацию, \(name.text ?? "") \(surname.text ?? "")"
        self.present(alertController, animated: true, completion: nil)
    }
}
