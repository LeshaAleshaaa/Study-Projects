//
//  ShowYearViewController.swift
//  UI-Kit (lesson 5, UIPicker)
//
//  Created by Алексей Смицкий on 21.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: ShowYearController

final class ShowYearViewController: UIViewController {
    
    //MARK: Propertys
    
    private lazy var yearLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView()
    }
    
    //MARK: Loading View and Methods
    
    private func loadingView() {
        view.addSubview(yearLabel)
        view.backgroundColor = .white
        yearLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
    }
    
    //Проверка года на високосность
    func checkYear(value: Int) {
        if value % 4 == 0 {
            yearLabel.text = "Выбранный год високосный"
        } else {
            yearLabel.text = "Выбранный год не високосный"
        }
    }
}
