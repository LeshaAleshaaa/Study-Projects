//
//  ViewController.swift
//  UI-Kit (lesson 5, UIPicker)
//
//  Created by Алексей Смицкий on 21.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: Main View Controller

final class MainViewController: UIViewController {
    
    //MARK: Propertys
    
    private lazy var timeLabel = UILabel()
    private lazy var dateLabel = UILabel()
    private lazy var timePicker = UIDatePicker()
    private lazy var datePicker = UIDatePicker()
    private lazy var showYearButton = UIButton()
    private lazy var whichYear = String()
    private lazy var clientButton = UIButton()
    private lazy var developerButton = UIButton()
    private lazy var choiseRegistration = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView()
    }
    
    //MARK: Loading View
    
    private func loadingView() {
        
        //Добавление вью на экран
        view.addSubview(timeLabel)
        view.addSubview(dateLabel)
        view.addSubview(timePicker)
        view.addSubview(datePicker)
        view.addSubview(showYearButton)
        view.addSubview(clientButton)
        view.addSubview(developerButton)
        view.addSubview(choiseRegistration)
        
        //Выставление координат
        timeLabel.frame = CGRect(x: 20, y: 50, width: 300, height: 50)
        dateLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
        timePicker.frame = CGRect(x: 20, y: 150, width: 300, height: 50)
        datePicker.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        showYearButton.frame = CGRect(x: 20, y: 250, width: 300, height: 50)
        choiseRegistration.frame = CGRect(x: 20, y: 400, width: 300, height: 50)
        clientButton.frame = CGRect(x: 20, y: 450, width: 300, height: 50)
        developerButton.frame = CGRect(x: 20, y: 550, width: 300, height: 50)
        
        //Локализация времени и даты
        timePicker.locale = Locale(identifier: "ru_RU")
        datePicker.locale = Locale(identifier: "ru_RU")
        
        //Отслеживание изменений
        datePicker.addTarget(self, action: #selector(dateSelector), for: .valueChanged)
        timePicker.addTarget(self, action: #selector(timeAlert), for: .valueChanged)
        showYearButton.addTarget(self, action: #selector(showYearVC), for: .touchDown)
        clientButton.addTarget(self, action: #selector(showClientVC), for: .touchDown)
        developerButton.addTarget(self, action: #selector(showDeveloperVC), for: .touchDown)
        
        //Выставление формата и значений
        timePicker.datePickerMode = .time
        datePicker.datePickerMode = .date
        showYearButton.backgroundColor = .gray
        clientButton.backgroundColor = .gray
        developerButton.backgroundColor = .gray
        showYearButton.setTitle("Показать какой год", for: .normal)
        timeLabel.text = "Выберите время ниже"
        dateLabel.text = "Выберите дату ниже"
        choiseRegistration.text = "Выберите формат регистрации"
        clientButton.setTitle("Как клиент", for: .normal)
        developerButton.setTitle("Как разработчик", for: .normal)
    }
    
    //MARK: Selectors
    
    //Селектор для даты
    @objc
    private func dateSelector() {
        //Форматирование даты
        let datePrint = DateFormatter()
        datePrint.dateStyle = .medium
        datePrint.dateFormat = "dd.MM.yyyy"
        let selectedDate = datePrint.string(from: datePicker.date)
        dateLabel.text = " Выбранная дата: \(selectedDate)"
    }
    
    //Алерт для вывода времени
    @objc
    private func timeAlert() {
        let alertController = UIAlertController(title: "Выбранное время", message: String(), preferredStyle: .alert)
        
        //Форматирование времени
        let timePrint = DateFormatter()
        timePrint.timeStyle = .short
        timePrint.dateFormat = "HH:mm"
        let selectedTime = timePrint.string(from: timePicker.date)
        
        //Кнопка выхода из алерта
        let doneButton = UIAlertAction(title: "Спасибо", style: .default) {[weak self] (done) in
            let value = alertController.message
            if let someTime = value {
                self?.timeLabel.text = "Выбранное время: \(someTime)"
            }
        }
        
        alertController.addAction(doneButton)
        alertController.message = "\(selectedTime)"
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Переход на экран показа года
    @objc
    private func showYearVC() {
        //Переход на экран
        let secondViewController = ShowYearViewController()
        secondViewController.modalPresentationStyle = .automatic
        present(secondViewController, animated: true, completion: nil)
        
        //Проверка високосности года
        let year = DateFormatter()
        year.dateFormat = "yyyy"
        whichYear = year.string(from: datePicker.date)
        if let some = Int(whichYear) {
            secondViewController.checkYear(value: some)
        }
    }
    
    //Переход для показа экрана регистрации клиента
    @objc
    private func showClientVC() {
        let secondViewController = RegistrationViewController()
        secondViewController.modalPresentationStyle = .automatic
        present(secondViewController, animated: true, completion: nil)
        secondViewController.checkButton(which: 1)
    }
    
    //Переход для показа экрана регистрации разработчика
    @objc
    private func showDeveloperVC() {
        let secondViewController = RegistrationViewController()
        secondViewController.modalPresentationStyle = .automatic
        present(secondViewController, animated: true, completion: nil)
        secondViewController.checkButton(which: 2)
    }
}
