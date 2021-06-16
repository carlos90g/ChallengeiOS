//
//  AppDelegate.swift
//  ChallengeiOS
//
//  Created by Carlos Garcia on 16/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setInitialScreen()
        return true
    }
    
    private func setInitialScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let home = HomeViewController()
        let navigationController = UINavigationController(rootViewController: home)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.navigationBar.isHidden = false
    }
    

}

