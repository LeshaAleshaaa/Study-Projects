//
//  Alert.swift
//  UIAnimations
//
//  Created by Алексей Смицкий on 27.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

extension ViewController {
    
    // MARK: - Public methods
    
    func alert(message: String) {
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        
        let doneButton = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
}
