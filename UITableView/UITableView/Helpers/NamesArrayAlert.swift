//
//  NamesArrayAlert.swift
//  UITableView
//
//  Created by Алексей Смицкий on 31.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

extension ViewController {
    
    @objc func addNewUser(){
        
        let alert = UIAlertController(title: "Внимание", message: "Введите имя и фамилию нового контакта", preferredStyle: .alert)
        
        alert.addTextField { (name) in
            name.placeholder = "Имя"
        }
        alert.addTextField { (surname) in
            surname.placeholder = "Фамилия"
        }
        
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let doneButton = UIAlertAction(title: "Добавить", style: .default) { (_) in
            
            if let name = alert.textFields?[0].text,
                let surname = alert.textFields?[1].text {
                if name.isEmpty && surname.isEmpty {
                    self.tableView.reloadData()
                } else {
                    let somebody = "\(name) \(surname)"
                    
                    self.namesArray.append(somebody)
                    self.tableView.reloadData()
                }
            }
        }
        
        alert.addAction(cancelButton)
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
}
