//
//  PickerView.swift
//  UIActivityVC
//
//  Created by Алексей Смицкий on 27.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - PickerView Extensioins

extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
}

// MARK: - PickerView Delegate

extension MainViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch row {
        case 0:
            return "Ничего не делать"
        case 1:
            return "Описание"
        case 2:
            return "Поделиться"
        default:
            break
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        func alert() {
            let alert = UIAlertController(title: "Внимание!", message: "Все фотографии представлены в разрешении 300х300, чтобы поделиться фото, смахните до следущего значения", preferredStyle: .alert)
            
            let donebutton = UIAlertAction(title: "Спасибо", style: .default, handler: nil)
            alert.addAction(donebutton)
            
            present(alert, animated: true, completion: nil)
        }
        
        func activityView() {
            if let image = imageView.image {
                let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                present(activity, animated: true, completion: nil)
            }
        }
        
        switch row {
        case 1:
            alert()
        case 2:
            activityView()
        default:
            break
        }
    }
}
