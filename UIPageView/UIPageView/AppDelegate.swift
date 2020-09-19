//
//  AppDelegate.swift
//  UIPageView
//
//  Created by Алексей Смицкий on 24.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    var mainscreen: UIWindow?
    
    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        mainscreen = UIWindow(frame: UIScreen.main.bounds)
        mainscreen?.makeKeyAndVisible()
        mainscreen?.rootViewController = UINavigationController(rootViewController: PageViewController())
        mainscreen?.backgroundColor = .white
        
        return true
    }
}
