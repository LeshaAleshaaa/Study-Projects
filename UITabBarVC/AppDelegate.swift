//
//  AppDelegate.swift
//  UITabBarVC
//
//  Created by Алексей Смицкий on 31.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    var rootWindow: UIWindow?
    
    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = InfoViewController()
        let secondViewController = SettingsViewController()
        
        let firstNavigationVC = UINavigationController(
            rootViewController: firstViewController)
        let secondNavigationVC = UINavigationController(
            rootViewController: secondViewController)
        
        firstViewController.title = "Резервное копирование в iCloud"
        secondViewController.title = "Форма обратной связи"
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(
            [firstNavigationVC,
             secondNavigationVC],
            animated: true)
        
        firstViewController.tabBarItem = UITabBarItem(
            title: "Инструкция",
            image: UIImage(named: "guide"),
            tag: 0)
        secondViewController.tabBarItem = UITabBarItem(
            title: "Настройки",
            image: UIImage(named: "settings"),
            tag: 1)
        
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow?.makeKeyAndVisible()
        rootWindow?.rootViewController = tabBarController
        rootWindow?.backgroundColor = .white
        
        return true
    }
}
