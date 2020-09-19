//
//  AppDelegate.swift
//  UICollectionViewController
//
//  Created by Алексей Смицкий on 03.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
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
        let trashViewConttoller = TrashViewController()
        let mainNaviController = UINavigationController(rootViewController: mainViewController)
        let trashNaviController = UINavigationController(rootViewController: trashViewConttoller)
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([mainNaviController, trashNaviController], animated: true)
        
        mainViewController.title = "Smith Store"
        trashViewConttoller.title = "Корзина"
        
        
        mainViewController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 0)
        trashViewConttoller.tabBarItem = UITabBarItem(
            tabBarSystemItem: .favorites,
            tag: 1)
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.rootViewController = tabBarController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
        return true
    }
}
