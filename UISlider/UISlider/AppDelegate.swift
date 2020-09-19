//
//  AppDelegate.swift
//  UISlider
//
//  Created by Алексей Смицкий on 22.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

//MARK: Main screen Launch

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var mainScreen: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        mainScreen = UIWindow(frame: UIScreen.main.bounds)
        let mainController = MainViewController()
        mainScreen?.rootViewController = mainController
        mainScreen?.makeKeyAndVisible()
        mainScreen?.backgroundColor = .white
        return true
    }
}
