//
//  ShowMoneyViewController.swift
//  StudyProject
//
//  Created by Алексей Смицкий on 17.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: ShowMoneyViewController

final class ShowMoneyViewController: UIViewController {
    
    //MARK: Propertys
    private lazy var roubleCount = UILabel()
    private lazy var dollarCount = UILabel()
    private lazy var euroCount = UILabel()
    private lazy var roubleValue = UILabel()
    private lazy var dollarValue = UILabel()
    private lazy var euroValue = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingLabels()
    }
    
    //MARK: LoadingPropertyMethod
    private func loadingLabels() {
        //Выставление координат лейблов
        roubleCount.frame = CGRect(x: 20, y: 50, width: 200, height: 30)
        dollarCount.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
        euroCount.frame = CGRect(x: 20, y: 150, width: 200, height: 30)
        roubleValue.frame = CGRect(x: 200, y: 50, width: 200, height: 30)
        dollarValue.frame = CGRect(x: 200, y: 100, width: 200, height: 30)
        euroValue.frame = CGRect(x: 200, y: 150, width: 200, height: 30)
        
        //Добавление вью на экран и цвета фона
        view.addSubview(roubleCount)
        view.addSubview(dollarCount)
        view.addSubview(euroCount)
        view.addSubview(roubleValue)
        view.addSubview(dollarValue)
        view.addSubview(euroValue)
        view.backgroundColor = .white
        
        //Присвоение вида и текста
        roubleCount.text = "Сумма в рублях"
        dollarCount.text = "Сумма в долларах"
        euroCount.text = "Сумма в евро"
    }
    
    //MARK: SetTextMethod
    
    //Метод для вычисления курса
    func setText(text: Int, second: Int) {
        switch second {
        case 1:
            let dollarCounting = text / 70
            roubleValue.text = "\(text) рублей"
            dollarValue.text = "\(dollarCounting) долларов"
        case 2:
            let euroCounting = text / 100
            roubleValue.text = "\(text) рублей"
            euroValue.text = "\(euroCounting) евро"
        case 3:
            roubleValue.text = "Выберете валюту"
        default:
            break
        }
    }
}
