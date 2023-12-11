//
//  AppDelegate.swift
//  Code_Challenge
//
//  Created by Austin Feight on 11/25/18.
//  Copyright © 2018 JOOR. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let mainCoordinator = MainCoordinator(service: TwitterClient.shared)
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainCoordinator.loadApp()
        window?.makeKeyAndVisible()
        
        return true
    }
}
