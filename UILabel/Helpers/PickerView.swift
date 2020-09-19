//
//  PickerView.swift
//  UILabel
//
//  Created by Алексей Смицкий on 05.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController Picker View Extensions

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Public methods
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}
