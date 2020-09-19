//
//  UIAlertController.swift
//  UISegmentControl
//
//  Created by Алексей Смицкий on 25.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {
    
    // MARK: - Public methods
    
    func alertTitleAndMessage(title: String?, message: String?, buttonTitle: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: buttonTitle, style: .default)
       
        alertController.addAction(doneButton)
        present(alertController, animated: true, completion: nil)
    }
    
}
