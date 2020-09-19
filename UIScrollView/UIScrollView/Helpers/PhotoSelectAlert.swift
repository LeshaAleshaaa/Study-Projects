//
//  AlertController.swift
//  UIScrollView
//
//  Created by Алексей Смицкий on 14.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Camera Alert Controller

extension FirstViewController: UINavigationControllerDelegate {
    
    // MARK: - Private methods
    
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Selectors
    
    @objc func showPhotoChooseAlert() {
        
        let alert = UIAlertController(title: "Выбор фотографии", message: "Откуда вы хотите добавить фото?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Фото альбом", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
