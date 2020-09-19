//
//  ViewController.swift
//  UIScrollView
//
//  Created by Алексей Смицкий on 12.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - FirstViewController

final class FirstViewController: UIViewController {
    
    // MARK: - Public properties
    
    var coordinator: Coordinator?
    
    // MARK: - Private properties
    
    private lazy var screenScroll = UIScrollView()
    private lazy var photoScroll = UIScrollView()
    private lazy var choosePhoto = UIImageView()
    private lazy var nameField = UITextField()
    private lazy var surnameField = UITextField()
    private lazy var nickNameField = UITextField()
    private lazy var eMailField = UITextField()
    private lazy var countyField = UITextField()
    private lazy var addPhotoLibary = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        screenScroll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenScroll.topAnchor.constraint(
                equalTo: view.topAnchor),
            screenScroll.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
            screenScroll.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            screenScroll.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)])
        
        photoScroll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoScroll.topAnchor.constraint(
                equalTo: screenScroll.topAnchor,
                constant: Constants.photoScrollTopAncor),
            photoScroll.widthAnchor.constraint(
                equalToConstant: Constants.photoScrollWidthAcnor),
            photoScroll.heightAnchor.constraint(
                equalToConstant: Constants.photoScrollHeightAncor),
            photoScroll.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        choosePhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            choosePhoto.widthAnchor.constraint(
                equalToConstant: Constants.choosePhotoWidthAncor),
            choosePhoto.heightAnchor.constraint(
                equalToConstant: Constants.choosePhotoHeightAncor),
            choosePhoto.centerXAnchor.constraint(
                equalTo: photoScroll.centerXAnchor),
            choosePhoto.centerYAnchor.constraint(
                equalTo: photoScroll.centerYAnchor)])
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(
                equalTo: photoScroll.bottomAnchor,
                constant: Constants.nameFieldTopAncor),
            nameField.widthAnchor.constraint(
                equalToConstant: Constants.nameFieldWidthAncor),
            nameField.heightAnchor.constraint(
                equalToConstant: Constants.nameFieldHeightAncor),
            nameField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        surnameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            surnameField.topAnchor.constraint(
                equalTo: nameField.bottomAnchor,
                constant: Constants.surnameFieldTopAncor),
            surnameField.widthAnchor.constraint(
                equalToConstant: Constants.surnameFieldWidthAncor),
            surnameField.heightAnchor.constraint(
                equalToConstant: Constants.surnameFieldHeightAncor),
            surnameField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        nickNameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nickNameField.topAnchor.constraint(
                equalTo: surnameField.bottomAnchor,
                constant: Constants.nicknameFieldTopAncor),
            nickNameField.widthAnchor.constraint(
                equalToConstant: Constants.nicknameFieldWidthAncor),
            nickNameField.heightAnchor.constraint(
                equalToConstant: Constants.nicknameFieldHeightAncor),
            nickNameField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        eMailField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eMailField.topAnchor.constraint(
                equalTo: nickNameField.bottomAnchor,
                constant: Constants.emailFieldTopAncor),
            eMailField.widthAnchor.constraint(
                equalToConstant: Constants.emailFieldWidthAncor),
            eMailField.heightAnchor.constraint(
                equalToConstant: Constants.emailFieldHeightAncor),
            eMailField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        countyField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countyField.topAnchor.constraint(
                equalTo: eMailField.bottomAnchor,
                constant: Constants.countryFieldTopAncor),
            countyField.widthAnchor.constraint(
                equalToConstant: Constants.countryFieldWidthAncor),
            countyField.heightAnchor.constraint(
                equalToConstant: Constants.countryFieldHeightAncor),
            countyField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
    }
    
    private func setphoto(image: UIImage?, rect: CGRect) -> UIImageView {
        
        let result = UIImageView(frame: rect)
        result.image = image
        result.contentMode = .scaleAspectFit
        return result
    }
    
    private func setupPhoto() {
        var imageviewRect = Constants.imageViewRect
        
        let smile = setphoto(image: Constants.smileImage, rect: imageviewRect)
        photoScroll.addSubview(smile)
        imageviewRect.origin.x += imageviewRect.size.width
        
        let sad = setphoto(image: Constants.sadImage, rect: imageviewRect)
        photoScroll.addSubview(sad)
        imageviewRect.origin.x += imageviewRect.size.width
        
        let happy = setphoto(image: Constants.happyImage, rect: imageviewRect)
        photoScroll.addSubview(happy)
        imageviewRect.origin.x += imageviewRect.size.width
    }
}

// MARK: - Setups

extension FirstViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true) { [weak self] in
            
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            self?.choosePhoto.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameField:
            surnameField.becomeFirstResponder()
        case surnameField:
            nickNameField.becomeFirstResponder()
        case nickNameField:
            eMailField.becomeFirstResponder()
        case eMailField:
            countyField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
    }
}

// MARK: - Setup Elements

private extension FirstViewController {
    
    func setupView() {
        setNotifications()
        setNaviBar()
        setScreenScroll()
        setNameField()
        setPhotoScroll()
        setSurnameField()
        setNickNameField()
        setEmailField()
        setCountryField()
    }
    
    func setNotifications() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { param in
            let keyboardRect = (param.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            self.view.frame.origin.y = -(keyboardRect.height)
            
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.screenScroll.setContentOffset(.zero, animated: true)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = Constants.viewZeroY
        }
    }
    
    func setNaviBar() {
        title = Constants.naviBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addPhotoLibary)
        addPhotoLibary.setImage(Constants.navibarItemImage, for: .normal)
        addPhotoLibary.contentMode = .scaleAspectFit
    }
    
    func setScreenScroll() {
        screenScroll.isUserInteractionEnabled = true
        screenScroll.contentSize = CGSize(
            width: view.bounds.size.width,
            height: view.bounds.size.height * 2)
        screenScroll.bounces = true
    }
    
    func setPhotoScroll() {
        photoScroll.contentSize = Constants.phoroScrollSize
        photoScroll.isPagingEnabled = true
        setupPhoto()
    }
    func setNameField() {
        nameField.contentMode = .center
        nameField.font = Constants.nameFieldFont
        nameField.borderStyle = .roundedRect
        nameField.layer.borderWidth = Constants.nameFieldBorder
        nameField.placeholder = Constants.nameFieldHolder
        nameField.delegate = self
    }
    
    func setSurnameField() {
        surnameField.contentMode = .center
        surnameField.font = Constants.surnameFieldFont
        surnameField.borderStyle = .roundedRect
        surnameField.layer.borderWidth = Constants.surnameFieldBorder
        surnameField.placeholder = Constants.surnameFieldHolder
        surnameField.delegate = self
    }
    
    func setNickNameField() {
        nickNameField.contentMode = .center
        nickNameField.font = Constants.nicknameFieldFont
        nickNameField.borderStyle = .roundedRect
        nickNameField.layer.borderWidth = Constants.nicknameFieldBorder
        nickNameField.placeholder = Constants.nicknameFieldHolder
        nickNameField.delegate = self
    }
    
    func setEmailField() {
        eMailField.contentMode = .center
        eMailField.font = Constants.emailFieldFont
        eMailField.borderStyle = .roundedRect
        eMailField.layer.borderWidth = Constants.emailFieldBorder
        eMailField.placeholder = Constants.emailFieldHolder
        eMailField.delegate = self
    }
    
    func setCountryField() {
        countyField.contentMode = .center
        countyField.font = Constants.countryFieldFont
        countyField.layer.borderWidth = Constants.countryFieldBorder
        countyField.borderStyle = .roundedRect
        countyField.placeholder = Constants.countryFieldHolder
        countyField.delegate = self
    }
}

// MARK: - Setup Elements

private extension FirstViewController {
    
    func addViews() {
        view.addSubview(screenScroll)
        screenScroll.addSubview(photoScroll)
        photoScroll.addSubview(choosePhoto)
        screenScroll.addSubview(nameField)
        screenScroll.addSubview(surnameField)
        screenScroll.addSubview(nickNameField)
        screenScroll.addSubview(eMailField)
        screenScroll.addSubview(countyField)
    }
    
    func addActions() {
        addPhotoLibary.addTarget(self, action: #selector(showPhotoChooseAlert), for: .touchUpInside)
    }
}

// MARK: - Constants

private extension FirstViewController {
    
    enum Constants {
        
        static let naviBarTitle: String = "Добро пожаловать!"
        static let navibarItemImage = UIImage(named: "camera")
        
        static let photoScrollTopAncor: CGFloat = 20
        static let photoScrollWidthAcnor: CGFloat = 300
        static let photoScrollHeightAncor: CGFloat = 300
        static let phoroScrollSize: CGSize = .init(width: 900, height: 200)
        
        static let choosePhotoWidthAncor: CGFloat = 300
        static let choosePhotoHeightAncor: CGFloat = 300
        
        static let nameFieldTopAncor: CGFloat = 100
        static let nameFieldWidthAncor: CGFloat = 300
        static let nameFieldHeightAncor: CGFloat = 50
        static let nameFieldFont: UIFont = .boldSystemFont(ofSize: 20)
        static let nameFieldBorder: CGFloat = 2
        static let nameFieldHolder: String = "Ваше имя"
        
        static let surnameFieldTopAncor: CGFloat = 100
        static let surnameFieldWidthAncor: CGFloat = 300
        static let surnameFieldHeightAncor: CGFloat = 50
        static let surnameFieldFont: UIFont = .boldSystemFont(ofSize: 20)
        static let surnameFieldBorder: CGFloat = 2
        static let surnameFieldHolder: String = "Ваша фамилия"
        
        static let nicknameFieldTopAncor: CGFloat = 100
        static let nicknameFieldWidthAncor: CGFloat = 300
        static let nicknameFieldHeightAncor: CGFloat = 50
        static let nicknameFieldFont: UIFont = .boldSystemFont(ofSize: 20)
        static let nicknameFieldBorder: CGFloat = 2
        static let nicknameFieldHolder: String = "Ваш никнейм"
        
        static let emailFieldTopAncor: CGFloat = 100
        static let emailFieldWidthAncor: CGFloat = 300
        static let emailFieldHeightAncor: CGFloat = 50
        static let emailFieldFont: UIFont = .boldSystemFont(ofSize: 20)
        static let emailFieldBorder: CGFloat = 2
        static let emailFieldHolder: String = "Ваша почта"
        
        static let countryFieldTopAncor: CGFloat = 100
        static let countryFieldWidthAncor: CGFloat = 300
        static let countryFieldHeightAncor: CGFloat = 50
        static let countryFieldFont: UIFont = .boldSystemFont(ofSize: 20)
        static let countryFieldBorder: CGFloat = 2
        static let countryFieldHolder: String = "Ваша страна"
        
        static let imageViewRect: CGRect = .init(x: 0, y: 0, width: 300, height: 300)
        static let smileImage = UIImage(named: "smile")
        static let sadImage = UIImage(named: "sad")
        static let happyImage = UIImage(named: "happy")
        
        static let viewZeroY: CGFloat = 0
    }
}
