//
//  AppDelegate.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(DataFromServer.apiKey.rawValue)
        
        let TabBarVC = TabBarViewController()
        let navController = UINavigationController(rootViewController: TabBarVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navController
        
        return true
    }



}

