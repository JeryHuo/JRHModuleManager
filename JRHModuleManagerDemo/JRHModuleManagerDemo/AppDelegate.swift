//
//  AppDelegate.swift
//  JRHModuleManagerDemo
//
//  Created by huojiarong on 2018/3/22.
//  Copyright © 2018年 huojiarong. All rights reserved.
//

import UIKit
import JRHModuleManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let plistPath = Bundle.main.path(forResource: "JRHModuleManager", ofType: "plist")!
        JRHModuleManager.shareInstance().loadModulesWithPlistFile(filePath: plistPath);
        _ = JRHModuleManager.shareInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        _ = JRHModuleManager.shareInstance().applicationDidEnterBackground(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        _ = JRHModuleManager.shareInstance().applicationWillEnterForeground(application)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        _ = JRHModuleManager.shareInstance().applicationWillTerminate(application)
    }


}

