//
//  AppDelegate.swift
//  UISegmentControl
//
//  Created by Алексей Смицкий on 24.07.2020.
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
          
        let mainViewController = MainViewController()
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.rootViewController = mainViewController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
        
        return true
    }
    
}
