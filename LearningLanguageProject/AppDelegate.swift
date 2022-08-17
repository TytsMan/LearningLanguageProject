//
//  AppDelegate.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let navController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navController)
        appCoordinator!.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navController
        window!.makeKeyAndVisible()
        
        return true
    }
}

