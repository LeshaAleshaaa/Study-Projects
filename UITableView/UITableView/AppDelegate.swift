//
//  AppDelegate.swift
//  UITableView
//
//  Created by Алексей Смицкий on 28.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties
    
    var mainScreen: UIWindow?
    
    // MARK: - Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        mainScreen?.rootViewController = navigationController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
        
        return true
    }
}
