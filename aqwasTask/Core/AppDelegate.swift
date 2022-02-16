//
//  AppDelegate.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initalizeWindow()
        start()
        return true
    }

    private func initalizeWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
    
    private func start() {
        let navigationController = UINavigationController(rootViewController: ResturantsViewController.create())
        window?.rootViewController = navigationController
    }

}

