//
//  ViewController.swift
//  UITextView
//
//  Created by Алексей Смицкий on 09.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var bookLabel = UILabel()
    private lazy var textView = UITextView()
    private lazy var blackTextButton = UIButton()
    private lazy var lightGrayTextButton = UIButton()
    private lazy var systemBlueTextButton = UIButton()
    private lazy var brownTextButton = UIButton()
    private lazy var smallTextButton = UIButton()
    private lazy var hugeTextButton = UIButton()
    private lazy var darkSwitch = UISwitch()
    private lazy var fontSizeSlider = UISlider()
    private lazy var fontStylePicker = UIPickerView()
    private lazy var switchText = UILabel()
    private lazy var sliderText = UILabel()
    
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
        
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.bookLabelTopAncor),
            bookLabel.heightAnchor.constraint(
                equalToConstant: Constants.bookLabelHeightAncor),
            bookLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(
                equalTo: bookLabel.bottomAnchor,
                constant: Constants.textViewTopAcnor),
            textView.widthAnchor.constraint(
                equalToConstant: Constants.textViewWidthAncor),
            textView.heightAnchor.constraint(
                equalToConstant: Constants.textViewHeightAncor),
            textView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        blackTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blackTextButton.topAnchor.constraint(
                equalTo: textView.bottomAnchor,
                constant: Constants.blackButtonTopAncor),
            blackTextButton.widthAnchor.constraint(
                equalToConstant: Constants.blackButtonWidthAncor),
            blackTextButton.heightAnchor.constraint(
                equalToConstant: Constants.blackButtonHeightAncor),
            blackTextButton.leadingAnchor.constraint(
                equalTo: textView.leadingAnchor)])
        
        lightGrayTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lightGrayTextButton.topAnchor.constraint(
                equalTo: textView.bottomAnchor,
                constant: Constants.lightGrayButtonTopAncor),
            lightGrayTextButton.widthAnchor.constraint(
                equalToConstant: Constants.lightGrayButtonWidthAncor),
            lightGrayTextButton.heightAnchor.constraint(
                equalToConstant: Constants.lightGrayButtonHeightAncor),
            lightGrayTextButton.leadingAnchor.constraint(
                equalTo: blackTextButton.trailingAnchor,
                constant: Constants.lightGrayLeadingAncor)])
        
        systemBlueTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            systemBlueTextButton.topAnchor.constraint(
                equalTo: blackTextButton.bottomAnchor,
                constant: Constants.systemBlueTextButtonTopAncor),
            systemBlueTextButton.widthAnchor.constraint(
                equalToConstant: Constants.systemBlueTextButtonWidthAncor),
            systemBlueTextButton.heightAnchor.constraint(
                equalToConstant: Constants.systemBlueTextButtonHeightAncor),
            systemBlueTextButton.leadingAnchor.constraint(
                equalTo: blackTextButton.leadingAnchor)])
        
        brownTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            brownTextButton.topAnchor.constraint(
                equalTo: lightGrayTextButton.bottomAnchor,
                constant: Constants.brownTextButtonTopAcnor),
            brownTextButton.widthAnchor.constraint(
                equalToConstant: Constants.brownTextButtonWidthAncor),
            brownTextButton.heightAnchor.constraint(
                equalToConstant: Constants.brownTextButtonHeightAncor),
            brownTextButton.leadingAnchor.constraint(
                equalTo: lightGrayTextButton.leadingAnchor)])
        
        smallTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            smallTextButton.topAnchor.constraint(
                equalTo: systemBlueTextButton.bottomAnchor,
                constant: Constants.smallTextButtonTopAncor),
            smallTextButton.widthAnchor.constraint(
                equalToConstant: Constants.smallTextButtonWidthAncor),
            smallTextButton.heightAnchor.constraint(
                equalToConstant: Constants.smallTextButtonHeightAncor),
            smallTextButton.leadingAnchor.constraint(
                equalTo: systemBlueTextButton.leadingAnchor)])
        
        hugeTextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hugeTextButton.topAnchor.constraint(
                equalTo: brownTextButton.bottomAnchor,
                constant: Constants.hugeTextButtonTopAncor),
            hugeTextButton.widthAnchor.constraint(
                equalToConstant: Constants.hugeTextButtonWidtthAncor),
            hugeTextButton.heightAnchor.constraint(
                equalToConstant: Constants.hugeTextButtonHeightAncor),
            hugeTextButton.leadingAnchor.constraint(
                equalTo: brownTextButton.leadingAnchor)])
        
        darkSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            darkSwitch.topAnchor.constraint(
                equalTo: textView.bottomAnchor,
                constant: Constants.darkSwitchTopAncor),
            darkSwitch.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.darkSwitchTrailingAcnor)])
        
        fontSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fontSizeSlider.topAnchor.constraint(
                equalTo: darkSwitch.bottomAnchor,
                constant: Constants.fontSizeSliderTopAncor),
            fontSizeSlider.widthAnchor.constraint(
                equalToConstant: Constants.fontSizeSliderWidthAncor),
            fontSizeSlider.heightAnchor.constraint(
                equalToConstant: Constants.fontSizeSliderHeightAncor),
            fontSizeSlider.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.fontSizeSliderTrailingAncor)])
        
        fontStylePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fontStylePicker.topAnchor.constraint(
                equalTo: fontSizeSlider.bottomAnchor,
                constant: Constants.fontStylePickerTopAncor),
            fontStylePicker.widthAnchor.constraint(
                equalToConstant: Constants.fontStylePickerWidthAncor),
            fontStylePicker.heightAnchor.constraint(
                equalToConstant: Constants.fontStylePickerHeightAncor),
            fontStylePicker.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.fontStylePickerTrailingAcnor)])
        
        switchText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            switchText.widthAnchor.constraint(
                equalToConstant: Constants.switchTextWidthAncor),
            switchText.leadingAnchor.constraint(
                equalTo: sliderText.leadingAnchor),
            switchText.centerYAnchor.constraint(
                equalTo: darkSwitch.centerYAnchor)])
        
        sliderText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sliderText.widthAnchor.constraint(
                equalToConstant: Constants.sliderTextWidthAncor),
            sliderText.trailingAnchor.constraint(
                equalTo: fontSizeSlider.leadingAnchor,
                constant: Constants.sliderTextTrailingAncor),
            sliderText.centerYAnchor.constraint(
                equalTo: fontSizeSlider.centerYAnchor)])
    }
    
    private func setDarkTheme() {
        view.backgroundColor = Constants.darkGrayColor
        textView.backgroundColor = Constants.darkGrayColor
    }
    
    private func setLightTheme() {
        view.backgroundColor = Constants.whiteColor
        textView.backgroundColor = Constants.whiteColor
    }
    
    // MARK: - Selectors
    
    @objc
    private func selectColor(button: UIButton) {
        switch button {
        case blackTextButton:
            textView.textColor = Constants.textViewBlackColor
        case lightGrayTextButton:
            textView.textColor = Constants.textViewLightGrayColor
        case systemBlueTextButton:
            textView.textColor = Constants.textViewSystemBlueColor
        case brownTextButton:
            textView.textColor = Constants.textViewBrownColor
        default:
            break
        }
    }
    
    @objc
    private func fontSize(sender: UISlider) {
        let fontSize = Int(sender.value)
        let font = textView.font?.withSize(CGFloat(fontSize))
        textView.font = font
    }
    
    @objc
    private func darkTheme(switchValue: Bool) {
        guard switchValue == darkSwitch.isOn else {
            setDarkTheme()
            return
        }
        setLightTheme()
    }
    
    @objc
    private func textSize(button: UIButton) {
        switch button {
        case smallTextButton:
            textView.text = textView.text.lowercased()
        case hugeTextButton:
            textView.text = textView.text.uppercased()
        default:
            textView.text = textView.text.lowercased()
        }
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupView() {
        setBookLabel()
        setTextView()
        setBlackButton()
        setLightGrayButton()
        setSystemBlueButton()
        setBrownButton()
        setSmallTextButton()
        setHugeTextButton()
        setDarkSwitch()
        setFontSizeSlider()
        setFontStylePicker()
        setSwitchText()
        setSlidetText()
    }
    
    func setBookLabel() {
        bookLabel.text = Constants.bookLabelText
        bookLabel.font = Constants.bookLabelFontSize
        bookLabel.contentMode = .center
    }
    
    func setTextView() {
        textView.text = Constants.textViewText
        textView.contentMode = .center
        textView.font = UIFont(name: Constants.fontStylePickerFirstRowText,
                               size: CGFloat(Constants.fontSizeSliderMinimun))
        textView.text = textView.text.lowercased()
        textView.delegate = self
    }
    
    func setBlackButton() {
        blackTextButton.backgroundColor = Constants.blackButtonColor
        blackTextButton.layer.cornerRadius = Constants.blackButtonRadius
    }
    
    func setLightGrayButton() {
        lightGrayTextButton.backgroundColor = Constants.lightGrayColor
        lightGrayTextButton.layer.cornerRadius = Constants.lightGrayRadius
    }
    
    func setSystemBlueButton() {
        systemBlueTextButton.backgroundColor = Constants.systemBlueTextButtonColor
        systemBlueTextButton.layer.cornerRadius = Constants.systemBlueTextButtonRadius
    }
    
    func setBrownButton() {
        brownTextButton.backgroundColor = Constants.brownTextButtonColor
        brownTextButton.layer.cornerRadius = Constants.brownTextButtonRadius
    }
    
    func setSmallTextButton() {
        smallTextButton.setTitle(Constants.smallTextButtonTitle, for: .normal)
        smallTextButton.backgroundColor = Constants.smallTextButtonColor
        smallTextButton.layer.cornerRadius = Constants.smallTextButtonRadius
    }
    
    func setHugeTextButton() {
        hugeTextButton.setTitle(Constants.hugeTextButtonTitle, for: .normal)
        hugeTextButton.backgroundColor = Constants.hugeTextButtonColor
        hugeTextButton.layer.cornerRadius = Constants.hugeTextButtonRadius
    }
    
    func setDarkSwitch() {
        darkSwitch.isOn = false
    }
    
    func setFontSizeSlider() {
        fontSizeSlider.minimumValue = Constants.fontSizeSliderMinimun
        fontSizeSlider.maximumValue = Constants.fontSizeSliderMaximum
    }
    
    func setFontStylePicker() {
        fontStylePicker.dataSource = self
        fontStylePicker.delegate = self
    }
    
    func setSwitchText() {
        switchText.text = Constants.switchTextText
        switchText.font = Constants.switchTextFontSize
        switchText.contentMode = .center
    }
    
    func setSlidetText() {
        sliderText.text = Constants.sliderTextText
        sliderText.font = Constants.sliderTextFontSize
        sliderText.contentMode = .center
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(bookLabel)
        view.addSubview(textView)
        view.addSubview(blackTextButton)
        view.addSubview(lightGrayTextButton)
        view.addSubview(systemBlueTextButton)
        view.addSubview(brownTextButton)
        view.addSubview(smallTextButton)
        view.addSubview(hugeTextButton)
        view.addSubview(darkSwitch)
        view.addSubview(fontSizeSlider)
        view.addSubview(fontStylePicker)
        view.addSubview(switchText)
        view.addSubview(sliderText)
    }
    
    func addActions() {
        blackTextButton.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        
        lightGrayTextButton.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        
        systemBlueTextButton.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        
        brownTextButton.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        
        fontSizeSlider.addTarget(self, action: #selector(fontSize(sender:)), for: .valueChanged)
        
        darkSwitch.addTarget(self, action: #selector(darkTheme), for: .valueChanged)
        
        smallTextButton.addTarget(self, action: #selector(textSize(button:)), for: .touchUpInside)
        
        hugeTextButton.addTarget(self, action: #selector(textSize(button:)), for: .touchUpInside)
    }
}

extension ViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.pickerViewRows
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.pickerViewComponents
    }
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch row {
        case 0:
            return Constants.fontStylePickerFirstRowText
        case 1:
            return Constants.fontStylePickerSecondRowText
        case 2:
            return Constants.fontStylePickerThirdRowText
        default:
            return Constants.fontStylePickerThirdRowText
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            textView.font = UIFont(name: Constants.fontStylePickerFirstRowText, size: CGFloat(fontSizeSlider.value))
        case 1:
            textView.font = UIFont(name: Constants.fontStylePickerSecondRowText , size: CGFloat(fontSizeSlider.value))
        case 2:
            textView.font = UIFont(name: Constants.fontStylePickerThirdRowText, size: CGFloat(fontSizeSlider.value))
        default:
            textView.font = UIFont(name: Constants.fontStylePickerFirstRowText, size: CGFloat(fontSizeSlider.value))
        }
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let bookLabelTopAncor: CGFloat = 10
        static let bookLabelHeightAncor: CGFloat = 70
        static let bookLabelText: String = "История Swift"
        static let bookLabelFontSize: UIFont = .boldSystemFont(ofSize: 25)
        
        static let textViewTopAcnor: CGFloat = 20
        static let textViewWidthAncor: CGFloat = 300
        static let textViewHeightAncor: CGFloat = 300
        static let textViewBlackColor: UIColor = .black
        static let textViewLightGrayColor: UIColor = .lightGray
        static let textViewSystemBlueColor: UIColor = .systemBlue
        static let textViewBrownColor: UIColor = .brown
        
        static let blackButtonTopAncor: CGFloat = 20
        static let blackButtonWidthAncor: CGFloat = 50
        static let blackButtonHeightAncor: CGFloat = 50
        static let blackButtonColor: UIColor = .black
        static let blackButtonRadius: CGFloat = 25
        
        static let lightGrayButtonTopAncor: CGFloat = 20
        static let lightGrayButtonWidthAncor: CGFloat = 50
        static let lightGrayButtonHeightAncor: CGFloat = 50
        static let lightGrayLeadingAncor: CGFloat = 20
        static let lightGrayColor: UIColor = .lightGray
        static let lightGrayRadius: CGFloat = 25
        
        static let systemBlueTextButtonTopAncor: CGFloat = 20
        static let systemBlueTextButtonWidthAncor: CGFloat = 50
        static let systemBlueTextButtonHeightAncor: CGFloat = 50
        static let systemBlueTextButtonColor: UIColor = .systemBlue
        static let systemBlueTextButtonRadius: CGFloat = 25
        
        static let brownTextButtonTopAcnor: CGFloat = 20
        static let brownTextButtonWidthAncor: CGFloat = 50
        static let brownTextButtonHeightAncor: CGFloat = 50
        static let brownTextButtonColor: UIColor = .brown
        static let brownTextButtonRadius: CGFloat = 25
        
        static let smallTextButtonTopAncor: CGFloat = 20
        static let smallTextButtonWidthAncor: CGFloat = 50
        static let smallTextButtonHeightAncor: CGFloat = 50
        static let smallTextButtonColor: UIColor = .lightGray
        static let smallTextButtonRadius: CGFloat = 25
        static let smallTextButtonTitle: String = "a"
        
        static let hugeTextButtonTopAncor: CGFloat = 20
        static let hugeTextButtonWidtthAncor: CGFloat = 50
        static let hugeTextButtonHeightAncor: CGFloat = 50
        static let hugeTextButtonColor: UIColor = .lightGray
        static let hugeTextButtonRadius: CGFloat = 25
        static let hugeTextButtonTitle: String = "A"
        
        static let darkSwitchTopAncor: CGFloat = 20
        static let darkSwitchTrailingAcnor: CGFloat = -20
        
        static let fontSizeSliderTopAncor: CGFloat = 20
        static let fontSizeSliderWidthAncor: CGFloat = 100
        static let fontSizeSliderHeightAncor: CGFloat = 50
        static let fontSizeSliderTrailingAncor: CGFloat = -20
        static let fontSizeSliderMinimun: Float = 15
        static let fontSizeSliderMaximum: Float = 50
        
        static let fontStylePickerTopAncor: CGFloat = 20
        static let fontStylePickerWidthAncor: CGFloat = 100
        static let fontStylePickerHeightAncor: CGFloat = 80
        static let fontStylePickerTrailingAcnor: CGFloat = -20
        static let fontStylePickerFirstRowText: String = "Arial"
        static let fontStylePickerSecondRowText: String = "Times New Roman"
        static let fontStylePickerThirdRowText: String = "AR CENA"
        
        static let pickerViewRows: Int = 3
        static let pickerViewComponents: Int = 1
        
        static let darkGrayColor: UIColor = .darkGray
        static let whiteColor: UIColor = .white
        
        static let switchTextWidthAncor: CGFloat = 70
        static let switchTextText: String = "Темная тема"
        static let switchTextFontSize: UIFont = .boldSystemFont(ofSize: 9)
        
        static let sliderTextTopAncor: CGFloat = 20
        static let sliderTextWidthAncor: CGFloat = 70
        static let sliderTextTrailingAncor: CGFloat = -10
        static let sliderTextText: String = "Размер текста"
        static let sliderTextFontSize: UIFont = .boldSystemFont(ofSize: 9)
        
        static let textViewText: String = """
            Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения. Создан компанией Apple в первую очередь для разработчиков iOS и macOS. Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на Objective-C. Swift задумывался как более лёгкий для чтения и устойчивый к ошибкам программиста язык, нежели предшествовавший ему Objective-C. Программы на Swift компилируются при помощи LLVM, входящей в интегрированную среду разработки Xcode 6 и выше. Swift может использовать рантайм Objective-C, что делает возможным использование обоих языков (а также С) в рамках одной программы. Старший вице-президент по разработке программного обеспечения Apple Крейг Федериги во время анонса этого продукта заявил, что язык программирования Swift был заложен ещё в платформе NeXT (ОС NeXTSTEP выпускалась в 1989—1995 годах), которая стала основой для современной macOS, а затем и iOS.
            
            Разработка текущего варианта языка Swift была начата в 2010 году Крисом Латтнером[en], руководителем отдела разработки инструментов для создания программного обеспечения Apple и одним из основных разработчиков LLVM. Swift заимствовал идеи из «Objective-C, Rust, Haskell, Ruby, Python, C#, CLU, и ещё из стольких многих языков, что сложно перечислить». Первоначально для нового языка использовали название Shiny.
            
            2 июня 2014 года на конференции WWDC Swift был официально представлен вместе с бесплатным руководством по использованию языка объёмом в 500 страниц, доступным на сервисе «iBook Store».
            
            8 июня 2015 года компания Apple объявила о выпуске новой версии Swift 2.0, которая получила более высокую производительность, новое API обработки ошибок, улучшения синтаксиса языка, а также функцию проверки доступности функций Swift для целевых ОС.
            
            3 декабря 2015 года была выпущена бета версия Swift 3.0 с поддержкой операционных систем OS X, iOS и Linux и лицензированная под открытой лицензией Apache 2.0 license with a Runtime Library Exception. Версия 3.0 обратно не совместима с более ранними версиями языка; начиная с нативной среды разработки XCode версии 9 более версии языка Swift-2 и ранее не поддерживаются.
            
            В начале апреля 2016 неназванный источник СМИ в корпорации Google сообщил, что компания рассматривает возможность перевода языка Swift в язык «первого класса» для платформы Android. Ранее уже предъявлялись прототипы Swift компилятора для Android.
            
            19 сентября 2017 года была выпущена версия Swift 4.0.
            
            В сентябре 2018 года, вместе с новой версией iOS 12, была выпущена новая стабильная версия языка Swift 4.2, и появилась бета-версия Swift 5.0. В версии 5.0 заявлена, наконец, стабильная работа ABI со стандартными библиотеками (Swift Dynamic Library), поддержка регулярных выражений и первоклассное решение для параллельной обработки данных с асинхронным режимом обработки async/await.
            
            20 сентября 2019 Swift 5.1 — это следующий крупный релиз Swift, и его задача наконец обеспечить стабильность ABI.
        """
    }
}
