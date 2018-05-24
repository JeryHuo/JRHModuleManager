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

    /// APP启动
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions")
        
        return true
    }
    
    /// 进入后台
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }
    
    /// 从后台返回
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    
    /// 关闭应用
    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }
}
