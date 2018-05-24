//
//  AppTimeLineModule.swift
//  JRHModuleManagerDemo
//
//  Created by huojiarong on 2018/3/21.
//  Copyright © 2018年 huojiarong. All rights reserved.
//

import UIKit
import JRHModuleManager


class AppTimeLineModule: NSObject, JRHModuleDelegate{

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }
    
    
}
