//
//  SettingsViewController.swift
//  UISlider
//
//  Created by Алексей Смицкий on 22.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: Settings View Controller

final class SettingsViewController: UIViewController {
    
    //MARK: Propertys
    
    private lazy var pickSex = UILabel()
    private lazy var nameLabel = UILabel()
    private lazy var nickLabel = UILabel()
    private lazy var sexPicker = UIPickerView()
    private lazy var name = UITextField()
    private lazy var nick = UITextField()
    private lazy var saveButton = UIButton()
    private lazy var fieldColor = UIColor.black
    private lazy var viewColor = UISlider()
    private lazy var viewColorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView()
    }
    
    //MARK: Methods
    
    private func loadingView() {
        
        //Добавление на экран
        view.addSubview(pickSex)
        view.addSubview(sexPicker)
        view.addSubview(name)
        view.addSubview(nick)
        view.addSubview(saveButton)
        view.addSubview(nameLabel)
        view.addSubview(nickLabel)
        view.addSubview(viewColor)
        view.addSubview(viewColorLabel)
        
        //Выставление координат
        pickSex.frame = CGRect(x: 10, y: 50, width: 100, height: 50)
        sexPicker.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        name.frame = CGRect(x: 100, y: 150, width: 200, height: 50)
        nick.frame = CGRect(x: 100, y: 250, width: 200, height: 50)
        saveButton.frame = CGRect(x: 0, y: 450, width: 200, height: 50)
        saveButton.center.x = view.center.x
        nameLabel.frame = CGRect(x: 10, y: 150, width: 100, height: 50)
        nickLabel.frame = CGRect(x: 10, y: 250, width: 100, height: 50)
        viewColorLabel.frame = CGRect(x: 10, y: 350, width: 120, height: 50)
        viewColor.frame = CGRect(x: 130, y: 350, width: 200, height: 50)
        
        
        //Присвоение вида и отслеживание кнопки
        pickSex.text = "Ваш пол:"
        nameLabel.text = "Ваше имя:"
        nickLabel.text = "Ваш ник:"
        saveButton.setTitle("Сохранить", for: .normal)
        viewColorLabel.text = "Цвет экрана:"
        name.layer.borderColor = fieldColor.cgColor
        nick.layer.borderColor = fieldColor.cgColor
        saveButton.backgroundColor = .gray
        name.layer.borderWidth = 1
        nick.layer.borderWidth = 1
        sexPicker.dataSource = self
        sexPicker.delegate = self
        saveButton.addTarget(self, action: #selector(goToPlayer), for: .touchDown)
        viewColor.addTarget(self, action: #selector(selectColor), for: .valueChanged)
        view.backgroundColor = .white
        
        //Параметры слайдера
        viewColor.minimumValue = 0.0
        viewColor.maximumValue = 4.0
    }
    
    //MARK: Selectors
    
    //Переход на следущий экран
    @objc
    func goToPlayer() {
        
        let goToPlayerVC = PlayerViewController()
        goToPlayerVC.modalPresentationStyle = .automatic
        present(goToPlayerVC, animated: true, completion: nil)
        
        if let whichName = nick.text {
            if whichName.isEmpty {
                goToPlayerVC.pullSettings(nickname: "Незнакомец")
            } else {
                goToPlayerVC.pullSettings(nickname: whichName)
            }
        }
    }
    
    //Выбор цвета
    @objc
    func selectColor() {
        switch viewColor.value {
        case 0.0...0.9:
            view.backgroundColor = .white
        case 1.0...1.9:
            view.backgroundColor = .systemRed
        case 2.0...2.9:
            view.backgroundColor = .systemTeal
        case 3.0...3.9:
            view.backgroundColor = .systemBlue
        case 4.0:
            view.backgroundColor = .systemPink
        default:
            break
        }
    }
}

//MARK: Picker Extensions

//Вид пикера
extension SettingsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
}

//Параметры пикера
extension SettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Мужчина"
        case 1:
            return "Женщина"
        case 2:
            return "Не выбран"
        default:
            break
        }
        return ""
    }
}
