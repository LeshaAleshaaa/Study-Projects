//
//  AppDelegate.swift
//  UINavigationVC
//
//  Created by Алексей Смицкий on 29.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties
    
    var rootscreen: UIWindow?
    
    // MARK: - Public Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = RootViewController()
        let navigationVC: UINavigationController? = UINavigationController(rootViewController: rootViewController)
        rootscreen = UIWindow(frame: UIScreen.main.bounds)
        rootscreen?.rootViewController = navigationVC
        rootscreen?.makeKeyAndVisible()
        rootscreen?.backgroundColor = .white
        
        return true
    }
}
