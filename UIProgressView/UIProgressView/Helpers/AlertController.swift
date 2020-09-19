//
//  AlertController.swift
//  UIProgressView
//
//  Created by Алексей Смицкий on 23.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

extension UIViewController {
    func alertController(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(button)
        
        self.present(alert, animated: true, completion: nil)
    }
}
