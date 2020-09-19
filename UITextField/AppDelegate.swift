//
//  AppDelegate.swift
//  UITextField
//
//  Created by Алексей Смицкий on 06.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    var mainScreen: UIWindow?
    
    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let registrationViewController = RegistrationViewController()
        let secondViewController = SecondViewController()
        
        let userData = UserDefaults.standard
        let keyValue = userData.string(forKey: "login")
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.makeKeyAndVisible()
        
        if let image = UIImage(named: "background") {
            mainScreen?.backgroundColor = UIColor(patternImage: image)
        }
        
        if UserDefaults.standard.value(forKey: "login") != nil {
            userData.removeObject(forKey: "login")
            mainScreen?.rootViewController = secondViewController
        } else {
            mainScreen?.rootViewController = registrationViewController
        }
        print("login is \(String(describing: keyValue))")
        
        return true
    }
}
