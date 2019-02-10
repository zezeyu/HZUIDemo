//
//  AppDelegate.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/6.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //界面
        self.window = UIWindow(frame: UIScreen.main.bounds)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        createTabBarController()
        return true
    }

}
// MARK: - 界面
extension AppDelegate {
    private func createTabBarController() {
        _ = HZBaseTabBarViewController().then{
            self.window?.rootViewController = $0
            self.window?.makeKeyAndVisible()
        }
    }
}

