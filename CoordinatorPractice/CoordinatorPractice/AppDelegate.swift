//
//  AppDelegate.swift
//  CoordinatorPractice
//
//  Created by Алексей Смицкий on 03.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationVC = UINavigationController()
        let coordinator = Coordinator(navigationVC: navigationVC)
        coordinator.start()
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }
    
}
