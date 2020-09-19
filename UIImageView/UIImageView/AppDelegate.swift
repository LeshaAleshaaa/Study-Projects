//
//  AppDelegate.swift
//  UIImageView
//
//  Created by Алексей Смицкий on 11.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Appdelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties
    
    var mainscreen: UIWindow?
    
    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationViewController = UINavigationController()
        let coordinator = Coordinator(navigationVC: navigationViewController)
        
        coordinator.start()

        mainscreen = UIWindow(frame: UIScreen.main.bounds)
        mainscreen?.rootViewController = navigationViewController
        mainscreen?.makeKeyAndVisible()
        mainscreen?.backgroundColor = .white
        
        return true
    }
}
