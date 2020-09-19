//
//  AppDelegate.swift
//  UIScrollView
//
//  Created by Алексей Смицкий on 12.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - Appdelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    var mainscreeen: UIWindow?

    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationViewController = UINavigationController()
        let coordinator = Coordinator(naviViewController: navigationViewController)
        
        coordinator.start()
        
        mainscreeen = UIWindow(frame: UIScreen.main.bounds)
        mainscreeen?.rootViewController = navigationViewController
        mainscreeen?.makeKeyAndVisible()
        mainscreeen?.backgroundColor = .white
        
        return true
    }
}
