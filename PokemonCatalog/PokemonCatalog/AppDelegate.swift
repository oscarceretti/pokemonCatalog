//
//  AppDelegate.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        window.rootViewController = vc // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

