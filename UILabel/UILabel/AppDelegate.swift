//
//  AppDelegate.swift
//  UILabel
//
//  Created by Алексей Смицкий on 04.08.2020.
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
        
        let rootViewController = ViewController()
        let mainScreenNavigation = UINavigationController(rootViewController: rootViewController)
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers([mainScreenNavigation], animated: true)
        rootViewController.tabBarItem = UITabBarItem(
            title: "Сохранить",
            image: UIImage(named: "save"),
            tag: 0)
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.rootViewController = tabBarController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
    
        return true
    }
}
