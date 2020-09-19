//
//  AppDelegate.swift
//  WKWebView
//
//  Created by Алексей Смицкий on 18.08.2020.
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
        
        // MARK: - Public properties
        
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        
        let firstNaviController = UINavigationController(rootViewController: firstViewController)
        let secondNaviController = UINavigationController(rootViewController: secondViewController)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstNaviController, secondNaviController], animated: true)
        
        firstViewController.title = "Браузер"
        secondViewController.title = "Просмотр PDF"
        
        firstNaviController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search,
            tag: 0)
        secondNaviController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 1)
        
        mainscreen = UIWindow(frame: UIScreen.main.bounds)
        mainscreen?.makeKeyAndVisible()
        mainscreen?.rootViewController = tabBarController
        mainscreen?.backgroundColor = .white
        
        return true
    }
}
