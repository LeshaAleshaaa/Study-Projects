//
//  PageViewController.swift
//  UIPageView
//
//  Created by Алексей Смицкий on 24.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - PageViewController

final class PageViewController: UIPageViewController {
    
    
    // MARK: - Private properties
    
    private lazy var phonesHelper = [PhoneInfo]()
    private lazy var phonesArray: [ViewController] = {
        var phonesVC = [ViewController]()
        for phone in phonesHelper {
            phonesVC.append(ViewController(whichPhone: phone))
        }
        return phonesVC
    }()
    
    // MARK: - Initalization
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        
        view.backgroundColor = .white
        title = "Выберите iPhone"
        
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([phonesArray[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Extensions

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewVC = viewController as? ViewController else { return nil }
        if let index = phonesArray.firstIndex(of: viewVC) {
            if index > 0 {
                return phonesArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewVC = viewController as? ViewController else { return nil }
        if let index = phonesArray.firstIndex(of: viewVC) {
            if index < phonesHelper.count - 1 {
                return phonesArray[index + 1]
            }
        }
        return nil
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return phonesHelper.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}


// MARK: - Setups

private extension PageViewController {
    
    func setupViews() {
        setFirstPhone()
        setSecondPhone()
        setThirdPhone()
        setFourthPhone()
    }
    
    func setFirstPhone() {
        if let image = Constants.firstPhoneImage {
            let firstPhone = PhoneInfo(
                phoneName: Constants.firstPhoneName,
                phoneImage: image,
                phoneText: Constants.firstPhoneText)
            phonesHelper.append(firstPhone)
        }
    }
    
    func setSecondPhone() {
        if let image = Constants.secondPhoneImage {
            let secondPhone = PhoneInfo(
                phoneName: Constants.secondPhoneName,
                phoneImage: image,
                phoneText: Constants.secondPhoneText)
            phonesHelper.append(secondPhone)
        }
    }
    
    func setThirdPhone() {
        if let image = Constants.thirdPhoneImage {
            let thirdPhone = PhoneInfo(
                phoneName: Constants.thirdPhoneName,
                phoneImage: image,
                phoneText: Constants.thirdPhoneText)
            phonesHelper.append(thirdPhone)
        }
    }
    
    func setFourthPhone() {
        if let image = Constants.fourthPhoneImage {
            let fourthPhone = PhoneInfo(
                phoneName: Constants.fourthPhoneName,
                phoneImage: image,
                phoneText: Constants.fourthPhoneText)
            phonesHelper.append(fourthPhone)
        }
    }
}

// MARK: - Constants

private extension PageViewController {
    
    enum Constants {
        
        static let firstPhoneName: String = "iPhone 11"
        static let firstPhoneImage = UIImage(named: "iPhone 11")
        static let firstPhoneText: String = "Экран 6.1"
        
        static let secondPhoneName: String = "iPhone 11 Pro"
        static let secondPhoneImage = UIImage(named: "iPhone 11 Pro")
        static let secondPhoneText: String = "Экран 5.8"
        
        static let thirdPhoneName: String = "iPhone 11 Pro Max"
        static let thirdPhoneImage = UIImage(named: "iPhone 11 Pro Max")
        static let thirdPhoneText: String = "Экран 6.5"
        
        static let fourthPhoneName: String = "iPhone SE"
        static let fourthPhoneImage = UIImage(named: "iPhone SE")
        static let fourthPhoneText: String = "Экран 4.7"
    }
}
