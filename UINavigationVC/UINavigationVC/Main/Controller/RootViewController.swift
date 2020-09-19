//
//  ViewController.swift
//  UINavigationVC
//
//  Created by Алексей Смицкий on 29.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - RootViewController

final class RootViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - Private properties
    
    private let directBarButton = UIButton()
    private let cameraBarButton = UIButton()
    private var choosePhoto = UISegmentedControl()
    private let photosGallery = UIImageView()
    
    // MARK: - Private methods
    
    private func layout() {
        
        choosePhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            choosePhoto.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.choosePhotoTopAncor),
            choosePhoto.widthAnchor.constraint(
                equalToConstant: Constants.choosePhotoWidthAncor),
            choosePhoto.heightAnchor.constraint(
                equalToConstant: Constants.choosePhotoHeightAncor),
            choosePhoto.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        
        photosGallery.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photosGallery.topAnchor.constraint(
                equalTo: choosePhoto.bottomAnchor,
                constant: Constants.photosGalleryTopAncor),
            photosGallery.widthAnchor.constraint(
                equalToConstant: Constants.photosGalleryWidthAncor),
            photosGallery.heightAnchor.constraint(
                equalToConstant: Constants.photosGalleryHeightAncor),
            photosGallery.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func choose(segment: UISegmentedControl) {
        
        if segment == choosePhoto {
            let segmentIndex = segment.selectedSegmentIndex
            let imageArray = [UIImage(named: "white"), UIImage(named: "black")]
            photosGallery.image = imageArray[segmentIndex]
        }
    }
    
    @objc
    private func gotoSendVC() {
        
        let sendMessageVC = SendMessageVC()
        navigationController?.pushViewController(sendMessageVC, animated: true)
        if let selectImage = photosGallery.image {
            sendMessageVC.pushImage(which: selectImage)
        }
    }
    
    @objc func cameraSelector(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addViews()
        addActions()
        layout()
    }
}

// MARK: - Setups

private extension RootViewController {
    
    func setupView() {
        setDirectBarButton()
        setCameraBarButton()
        setChoosePhoto()
    }
    
    func setDirectBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: directBarButton)
        directBarButton.setImage(Constants.directBarButtonImage, for: .normal)
        directBarButton.contentMode = .scaleAspectFit
    }
    
    func setCameraBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cameraBarButton)
        cameraBarButton.setImage(Constants.cameraBarButtonImage, for: .normal)
        cameraBarButton.contentMode = .scaleAspectFit
    }
    
    func setChoosePhoto() {
        choosePhoto = UISegmentedControl(items: Constants.choosePhotoArray)
    }
}

extension RootViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        photosGallery.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Setup Elements

private extension RootViewController {
    
    func addViews() {
        title = "Choose photo"
        view.addSubview(choosePhoto)
        view.addSubview(photosGallery)
    }
    
    func addActions() {
        choosePhoto.addTarget(self, action: #selector(choose(segment:)), for: .valueChanged)
        directBarButton.addTarget(self, action: #selector(gotoSendVC), for: .touchDown)
        cameraBarButton.addTarget(self, action: #selector(cameraSelector), for: .touchDown)
    }
}

// MARK: - Constants

private extension RootViewController {
    
    enum Constants {
        static let directBarButtonImage = UIImage(named: "send")
        
        static let cameraBarButtonImage = UIImage(named: "camera")
        
        static let choosePhotoTopAncor: CGFloat = 100
        static let choosePhotoWidthAncor: CGFloat = 300
        static let choosePhotoHeightAncor: CGFloat = 50
        
        static let photosGalleryTopAncor: CGFloat = 20
        static let photosGalleryWidthAncor: CGFloat = 400
        static let photosGalleryHeightAncor: CGFloat = 400
        
        static let choosePhotoArray: [String] = ["White", "Black"]
    }
}
