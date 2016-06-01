//
//  AppDelegate.swift
//  SamsaoTest
//
//  Created by NIE Shanhe on 3/30/16
//  Copyright (c) 2016 Samsao. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        IQKeyboardManager.sharedManager().enable = true

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.makeKeyAndVisible()
        window!.rootViewController = SSOLoginViewController()

        return true
    }
}
