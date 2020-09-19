//
//  SelectMoneyViewController.swift
//  StudyProject
//
//  Created by Алексей Смицкий on 15.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: SelectMoneyViewController

final class SelectMoneyViewController: UIViewController {
    
    //MARK: Propertys
    private lazy var welcomeLabel = UILabel()
    private lazy var convertValueLabel = UILabel()
    private lazy var convertButton = UIButton()
    private lazy var roubleLabel = UILabel()
    private lazy var dollarLabel = UILabel()
    private lazy var euroLabel = UILabel()
    private lazy var dollarSwitch = UISwitch()
    private lazy var euroSwitch = UISwitch()
    private lazy var showMoneyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingLabels()
    }
    
    //MARK: LoadingViewMethod
    private func loadingLabels() {
        //Присвоение координат лейблам
        welcomeLabel.frame = CGRect(x: 100, y: 20, width: 200, height: 30)
        convertValueLabel.frame = CGRect(x: 200, y: 100, width: 150, height: 50)
        roubleLabel.frame = CGRect(x: 20, y: 100, width: 200, height: 50)
        dollarLabel.frame = CGRect(x: 20, y: 150, width: 200, height: 50)
        euroLabel.frame = CGRect(x: 20, y: 200, width: 200, height: 50)
        
        //Присвоение координат кнопке и свитчам
        convertButton.frame = CGRect(x: 20, y: 50, width: 300, height: 30)
        dollarSwitch.frame = CGRect(x: 200, y: 150, width: 50, height: 50)
        euroSwitch.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        showMoneyButton.frame = CGRect(x: 20, y: 250, width: 300, height: 50)
        
        //Создание вью лейблов, кнопок и свитчей
        view.addSubview(welcomeLabel)
        view.addSubview(convertButton)
        view.addSubview(convertValueLabel)
        view.addSubview(roubleLabel)
        view.addSubview(dollarLabel)
        view.addSubview(euroLabel)
        view.addSubview(dollarSwitch)
        view.addSubview(euroSwitch)
        view.addSubview(showMoneyButton)
        
        //Присвоение первоначального текста и вида
        welcomeLabel.text = "Конвертер рубля"
        convertButton.setTitle("Нажмите для ввода суммы", for: .normal)
        showMoneyButton.setTitle("Показать сумму", for: .normal)
        roubleLabel.text = "Валюта в рублях"
        dollarLabel.text = "Долларов в рублях"
        euroLabel.text = "Евро в рублях"
        convertValueLabel.text = "0 рублей"
        convertButton.addTarget(self, action: #selector(enterValue), for: .touchUpInside)
        showMoneyButton.addTarget(self, action: #selector(gotoSecondVC), for: .touchUpInside)
        showMoneyButton.backgroundColor = .gray
        convertButton.backgroundColor = .gray
    }
    
    //MARK: Selectors
    //Alert Controller
    @objc
    private func enterValue() {
        let alertController = UIAlertController(title: "Внимание!", message: "Введите сумму в рублях", preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel) { (cancel) in
        }
        let doneButton = UIAlertAction(title: "Готово", style: .default) { [weak self] (done) in
            let value = alertController.textFields?.first?.text
            if let valueLabel = self?.convertValueLabel.text {
                if valueLabel.isEmpty {
                    self?.convertValueLabel.text = "Вы ничего не ввели"
                } else {
                    self?.convertValueLabel.text = value
                }
            }
        }
        alertController.addAction(cancelButton)
        alertController.addAction(doneButton)
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
        }
        self.present(alertController,animated: true, completion: nil)
    }
    
    //Переход к другому экрану с проверкой включенного свитча
    @objc
    private func gotoSecondVC() {
        let secondViewController = ShowMoneyViewController()
        secondViewController.modalPresentationStyle = .automatic
        present(secondViewController, animated: true, completion: nil)
        
        if let convertDollar = convertValueLabel.text {
            if dollarSwitch.isOn {
                let convertedValue = Int(convertDollar)
                secondViewController.setText(text: convertedValue ?? 0, second: 1)
            }
            else {
                secondViewController.setText(text: 0, second: 3)
            }
            
            if let convertEuro = convertValueLabel.text {
                if euroSwitch.isOn {
                    let convertedValue = Int(convertEuro)
                    secondViewController.setText(text: convertedValue ?? 0, second: 2)
                }
            }
        }
    }
}
