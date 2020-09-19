//
//  ViewController.swift
//  UISlider
//
//  Created by Алексей Смицкий on 22.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: Main View Controller

final class MainViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var email = UITextField()
    private lazy var password = UITextField()
    private lazy var loginButton = UIButton()
    private lazy var helloLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var passwordLabel = UILabel()
    private lazy var textFieldColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView()
    }
    
    //MARK: Loading View Method
    
    private func loadingView() {
        
        //Добавление на экран
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(helloLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        
        //Выставление координат
        email.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        password.frame = CGRect(x: 0, y: 300, width: 200, height: 50)
        loginButton.frame = CGRect(x: 0, y: 400, width: 200, height: 50)
        helloLabel.frame = CGRect(x: 0, y: 50, width: 200, height: 50)
        emailLabel.frame = CGRect(x: 0, y: 150, width: 200, height: 50)
        passwordLabel.frame = CGRect(x: 0, y: 250, width: 200, height: 50)
        email.center.x = view.center.x
        password.center.x = view.center.x
        loginButton.center.x = view.center.x
        helloLabel.center.x = view.center.x
        emailLabel.center.x = view.center.x
        passwordLabel.center.x = view.center.x
        
        //Формирование рамки для текстовых полей и образа кнопки
        email.layer.borderColor = textFieldColor.cgColor
        email.layer.borderWidth = 1
        password.layer.borderColor = textFieldColor.cgColor
        password.layer.borderWidth = 1
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .gray
        helloLabel.text = "Добро пожаловать!"
        emailLabel.text = "e-mail"
        passwordLabel.text = "Пароль"
        
        //Отслеживание действия
        loginButton.addTarget(self, action: #selector(goToSettingsVC), for: .touchDown)
    }
    
    //MARK: Selectors
    
    //Переход на контроллер настроек
    @objc
    private func goToSettingsVC() {
        
        //Проверка поля эмейла и пароля
        if let emailCheck = email.text?.count, let passwordChek = password.text?.count {
            
            if emailCheck >= 10 || passwordChek >= 8 {
                let settingsViewController = SettingsViewController()
                settingsViewController.modalPresentationStyle = .automatic
                present(settingsViewController, animated: true, completion: nil)
            } else {
                
                //Алерт в случае не прохода проверки
                let alert = UIAlertController(title: "Внимание!", message: "Емейл должен быть от 10 симоволов, а пароль от 8 символов", preferredStyle: .actionSheet)
                let doneButton = UIAlertAction(title: "Хорошо", style: .default) { (done) in
                }
                
                alert.addAction(doneButton)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
