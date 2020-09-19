//
//  AppDelegate.swift
//  StudyProject
//
//  Created by Алексей Смицкий on 11.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var loadingMainView: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loadingMainView = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = SelectMoneyViewController()
        loadingMainView?.rootViewController = mainViewController
        loadingMainView?.makeKeyAndVisible()
        loadingMainView?.backgroundColor = .white
        return true
    }
}
