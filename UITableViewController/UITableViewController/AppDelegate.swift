//
//  AppDelegate.swift
//  UITableViewController
//
//  Created by Алексей Смицкий on 31.08.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public properties
    
    var mainScreen: UIWindow?
    
    // MARK: - Public methods
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.rootViewController = navigationController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
        
        return true
    }
}
